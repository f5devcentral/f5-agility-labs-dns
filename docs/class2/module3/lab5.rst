Zone Transfer
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

.. admonition:: TMSH

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

.. admonition:: TMSH

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
