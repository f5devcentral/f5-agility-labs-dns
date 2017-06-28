Slave from Off-box BIND
-----------------------

*  **Objective:** In this use-case, you will configure GTM as the
   authoritative slave using an off-box BIND server as the hidden
   master. This is a very common architecture to serve either external
   or internal zones with large scale RPS via DNS Express. You will
   configure the following common components:
* DNS Profile and Listeners
* DNS Express
* DNS Query Logging
* DNS Statistics
* DNSSEC signing
* Estimated completion time: 25 minutes

Configuring DNS Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* You are going to configure DNS query and response logging. To do
  this, you must tell GTM where to send logs to (a log publisher) and
  what specifically to log (DNS logging profile).
* For lab purposes, we are going to use local-syslog as our logging
  destination.

.. NOTE:: remote high-speed logging is highly recommended for production environments.

* Log in to https://gtm1.site1.example.com from the jumpbox
  desktop and using user: *admin* password: *admin*
* In the GUI, navigate to: **System > Logs > Configuration > Log Publishers: Create**
* Create a new DNS Log Publisher as shown in the table below.

*Keep the defaults if not noted in the table.*

+--------------------+----------------------------------------+
| **Name**           | dns-local-syslog                       |
+====================+========================================+
| **Destinations**   | Move local-syslog to Selected column   |
+--------------------+----------------------------------------+

* Click **Finished** to create.
* In the GUI, navigate to: **DNS > Delivery > Profiles > Other > DNS Logging: Create**
* Create a new DNS logging profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------+---------------------------+
| **Name**               | dns-logging               |
+========================+===========================+
| **Log Publisher**      | Select dns-local-syslog   |
+------------------------+---------------------------+
| **Log Responses**      | Enabled                   |
+------------------------+---------------------------+
| **Include Query ID**   | Enabled                   |
+------------------------+---------------------------+

* Click **Finished** to create.
* Your new dns-logging profile should now have all options enabled.

Create a new DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~~

* A DNS profile tells the DNS Listener how to process DNS traffic.
  We’re going to make some tweaks for our use-case and lab environment.
* In the GUI, navigate to: **DNS > Delivery > Profiles > DNS: Create**
* Create a new DNS profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------------------+--------------------------------+
| **Name**                           | AuthNS-offbox-BIND             |
+====================================+================================+
| **Unhandled Query Action**         | Drop                           |
+------------------------------------+--------------------------------+
| **Use BIND Server on Big-IP**      | Disabled                       |
+------------------------------------+--------------------------------+
| **Logging**                        | Enabled                        |
+------------------------------------+--------------------------------+
| **Logging Profile**                | dns-logging                    |
+------------------------------------+--------------------------------+
| **AVR Statistics Sampling Rate**   | Enabled; 1/1 queries sampled   |
+------------------------------------+--------------------------------+

* Click **Finished** to create.
* For lab purposes, we are going to use sample all DNS queries with AVR.

.. NOTE:: production sampling rates would be a much lower rate
   as this would severely impact performance.

Create DNS Listeners
~~~~~~~~~~~~~~~~~~~~~

We are going to create both UDP and TCP external listeners. The
external Listener will be our target IP address when querying GTM.

* In the GUI, navigate to: **DNS > Delivery > Listeners > Listener List: Create**
* Create two **external** Listeners as shown in the tables below.

*Keep the defaults if not noted in the table.*

+-------------------------+-------------------------+
| **Name**                | external-listener-UDP   |
+=========================+=========================+
| **Destination**         | Host: 203.0.113.8       |
+-------------------------+-------------------------+
| **VLAN Traffic**        | Enabled on..            |
+-------------------------+-------------------------+
| **VLANs and Tunnels**   | External                |
+-------------------------+-------------------------+
| **DNS Profile**         | AuthNS-offbox-BIND      |
+-------------------------+-------------------------+

+-------------------------+-------------------------+
| **Name**                | external-listener-TCP   |
+=========================+=========================+
| **Destination**         | Host: 203.0.113.8       |
+-------------------------+-------------------------+
| **VLAN Traffic**        | Enabled on..            |
+-------------------------+-------------------------+
| **VLANs and Tunnels**   | External                |
+-------------------------+-------------------------+
| **Protocol**            | TCP                     |
+-------------------------+-------------------------+
| **DNS Profile**         | AuthNS-offbox-BIND      |
+-------------------------+-------------------------+

* For each Listener, click **Finished** to create.

* You should now have two UDP-based DNS Listeners and two TCP-based
  Listeners configured.

Create a Nameserver for Hidden Master
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We next need to tell GTM about our Hidden Master that DNS Express will
slave from.

* In the GUI, navigate to: **DNS > Delivery > Nameservers > Nameserver List: Create**
* Create offbox-BIND as a Nameserver as shown in the table below.

*Keep the defaults if not noted in the table.*

+---------------+-----------------+
| **Name**      | Offbox-BIND     |
+===============+=================+
| **Address**   | 203.0.113.15    |
+---------------+-----------------+

* Click **Finished** to create.

Create a zone to transfer from Hidden Master
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will now configure the specific zone for GTM to obtain from the
Hidden Master. Note that the BIND server already has some key
configuration elements to consider:

* “Allow-transfer” (for lab purposes, any sourceIP is allowed)
* “Also-notify” for your internal Listener IP address.
* TSIG is disabled.
* Before we configure the zone, we are going to enable some debug
  logging so that you can see what happens underneath the covers. SSH
  to your F5 BIGIP1. You should have a BIGIP1 putty icon on your
  desktop. Use username: **root** password: **default** and issue the
  following TMSH command once logged in.

.. code-block:: console

    tmsh modify sys db log.zxfrd.level value "debug"


* Now, view the log file real-time by issuing this command at the SSH prompt:

.. code-block:: console

    tail –f /var/log/ltm

.. NOTE:: You can make the putty window larger if needed

Keep your ssh session open while performing the rest of the steps.
You can break out of the tail process with *<Ctrl-C>*.

* In the GUI, navigate to: **DNS > Zones > Zones > Zone List: Create**
* Create the **“dnsx.com”** zone as shown in the figure below and then
  click **Finished.**

|image1|

* You should see log messages in your SSH console indicating a
  successful transfer from the hidden master. You can also view the
  state of the transfer by clicking back on the newly created zone and
  observing the “Availability” as shown in the figure below.

|image2|

* Issue the following command from SSH console to see specifics of the
  status and statistics related to the zone.

.. code-block:: console

   tmsh show ltm dns zone dnsx.com | more

* The dnsx.com zone is configured with a 60 second refresh interval –
  meaning that DNS Express will proactively check the Master Nameserver
  every 60 seconds for zone updates. This very low interval is merely
  for lab purposes so you can view what happens in the logs. The log
  messages look like this:

.. code-block:: console

  Jun 22 14:49:38 gtm1 debug zxfrd[4251]: 01531023:7: Scheduling zone transfer in 60s for dnsx.com from 203.0.113.15.
  Jun 22 14:49:38 gtm1 debug zxfrd[4251]: 01531106:7: Availability status of dnsx.com changed from YELLOW to GREEN.
  Jun 22 14:50:38 gtm1 debug zxfrd[4251]: 01531025:7: Serials equal (2017062201); transfer for zone dnsx.com complete.
  Jun 22 14:50:38 gtm1 debug zxfrd[4251]: 01531008:7: Resetting transfer state for zone dnsx.com.
  Jun 22 14:50:38 gtm1 debug zxfrd[4251]: 01531023:7: Scheduling zone transfer in 60s for dnsx.com from 203.0.113.15.

* Now, issue the following command in the SSH console to view what is
  in DNS Express.

.. code-block:: console

   dnsxdump | more

* Open the command prompt from your windows desktop. Issue a DNS query
  against your external listener for a record in the dnsx.com zone and
  verify that it succeeds. For example:

.. code-block:: console

   dig @203.0.113.8 +short www1.dnsx.com


* Issue several more queries of different types to generate some
  interesting statistics. Here are some examples:

.. code-block:: console

   dig @203.0.113.8 +short www1.dnsx.com
   dig @203.0.113.8 +short www2.dnsx.com
   dig @203.0.113.8 +short www3.dnsx.com
   dig @203.0.113.8 +short bigip1.dnsx.com
   dig @203.0.113.8 +short bigip2.dnsx.com
   dig @203.0.113.8 +short MX dnsx.com
   dig @203.0.113.8 +short NS dnsx.com

* Now is a good time to check query logging. Look at ``/var/log/ltm`` (i.e.
  ``tail /var/log/ltm``) to ensure that you’re properly logging queries
  and responses. It should look something like this:

.. code-block:: console

   Jun 22 14:55:14 gtm1 info tmm[10506]: 2017-06-22 14:55:14 gtm1.site1.example.com qid 340 from 203.0.113.1#50316: view none: query: www3.dnsx.com IN A + (203.0.113.8%0)
   Jun 22 14:55:14 gtm1 info tmm[10506]: 2017-06-22 14:55:14 gtm1.site1.example.com qid 340 to 203.0.113.1#50316: [NOERROR qr,aa,rd] response: www3.dnsx.com. 100 IN A 203.0.113.103;


* In the GUI, navigate to **Statistics > Analytics > DNS**. Notice that
  you can view statics by different data points, over different periods of
  time, and drill down into different aspects. Spend a few moments looking
  at the various options.

.. NOTE:: This may take up to 5 minutes to populate.

If no data exists, come back after the next task.

Enable DNSSEC for the zone
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will now sign the dnsx.com zone. In this example, we are configuring
GTM to sign the zone on the fly rather than signing the actual static
zone information (which can be done starting in v11.5 but is outside the
scope of this lab).

* In the GUI, navigate to: **DNS > Delivery > Keys > DNSSEC Key List: Create**
* Create two keys as defined in the tables below.

*Keep the defaults if not noted in the table.*

+----------------------+--------------------+
| **Name**             | dnsx.com\_zsk      |
+======================+====================+
| **Type**             | Zone Signing Key   |
+----------------------+--------------------+
| **Key Management**   | Manual             |
+----------------------+--------------------+
| **Certificate**      | default.crt        |
+----------------------+--------------------+
| **Private Key**      | default.key        |
+----------------------+--------------------+

+----------------------+-------------------+
| **Name**             | dnsx.com\_ksk     |
+======================+===================+
| **Type**             | Key Signing Key   |
+----------------------+-------------------+
| **Key Management**   | Manual            |
+----------------------+-------------------+
| **Certificate**      | default.crt       |
+----------------------+-------------------+
| **Private Key**      | default.key       |
+----------------------+-------------------+

* Click **Finished** to create each key.
* In the GUI, navigate to: **DNS > Zones > DNSSEC Zones > DNSSEC Zone List: Create**
* Configure the dnsx.com zone for DNSSEC using the previously created
  keys as shown below.

|image3|

* Test that the zone is successfully signed by issuing a DNSSEC query
  to the external listener. For example:

.. code-block:: console

   dig @203.0.113.8 +dnssec www1.dnsx.com

You should see RRSIG records indicating that the zone is signed. You
will also note signing in the query logs (``/var/log/ltm``)

* Finally, view some other DNS statistics related to queries, DNSSEC, zone transfers, notifies, etc.
* In the GUI, navigate to: **DNS > Zone > Zones > Zone List.**
* Click on the “dnsx.com” zone and then select “Statistics” from the top menu bar.
* Select the “View” Details as shown in the diagram below:

|image4|

* View the types of statistics available for the zone such as serial number, number of records, etc.
* In the GUI, navigate to: **Statistics > Module Statistics > DNS > Zones**.
* Set “Statistics Type” to **“DNSSEC Zones”.**
* View details as performed above. Note the various DNSSEC statistics available.
* If the graphs from task 5 weren’t available earlier, revisit
  **Statistics > Analytics > DNS** now and explore.

.. |image0| image:: /_static/class2/image2.png
   :width: 5.30972in
   :height: 2.02776in
.. |image1| image:: /_static/class2/image4.png
   :width: 3.93000in
   :height: 3.05000in
.. |image2| image:: /_static/class2/image5.png
   :width: 2.66667in
   :height: 1.41319in
.. |image3| image:: /_static/class2/image6.png
   :width: 3.23729in
   :height: 2.35556in
.. |image4| image:: /_static/class2/image7.png
   :width: 3.96000in
   :height: 1.71000in
