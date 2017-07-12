Slave from On-box BIND
----------------------

In this use-case, you will configure GTM as an authoritative slave
using on-box BIND managed by ZoneRunner.

Estimated completion time: 15 minutes

Profiles
~~~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Delivery > Profiles > DNS: Create.**
  Create a new DNS profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------------------+--------------------------------+
| **Name**                           | AuthNS-onbox-BIND              |
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

For lab purposes, we are going to sample all DNS queries with AVR.

.. NOTE:: Production sampling rates would be a much lower rate.


Listeners
~~~~~~~~~~~~~~~~~~

We need to edit the external-listeners to use the new DNS profile
created above.

* In the GUI, navigate to: **DNS > Delivery > Listeners > Listener List**
* Edit the external-listener-UDP to use the AuthNS-onbox-BIND DNS
  profile.
* Edit the external-listener-TCP to use the AuthNS-onbox-BIND DNS
  profile.
* Click **Update** after change DNS profile to finish edition.

ZoneRunner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Zones: ZoneRunner > Zone List: Create**
* Add a student1.com zone with the information as shown in the
  following screenshot. Note the “also-notify” message needs to be
  added to send a NOTIFY message to an internal GTM IP address for
  processing. Likewise BIND needs to allow the transfer from the
  loopback address. The diagram below shows the basic operation.

|image5|

|image6|

Onbox Nameserver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Next, we need to tell DNS Express that on-box BIND is available to use
as a source for zone transfers.

* In the GUI, navigate to: **DNS > Delivery > Nameservers > Nameserver List: Create**
* Create a loopback as a Nameserver as shown in the table below.

*Keep the defaults if not noted in the table.*

+---------------+--------------+
| **Name**      | ZoneRunner   |
+===============+==============+
| **Address**   | 127.0.0.1    |
+---------------+--------------+

-  Click **Finished** to create.

Create a DNS Express zone to transfer from ZoneRunner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will now configure the specific zone for GTM to obtain from
ZoneRunner. Note that on-box BIND already has some key configuration
elements to consider:

* “Allow-transfer” from the localhost.
* “Also-notify” for DNS Express internal Listener IP address.
* TSIG is disabled.

* In the GUI, navigate to: **DNS > Zones > Zones > Zone List: Create**
* Create the “student1.com” zone as shown in the figure below and then
  click **Finished.**

|image7|

* Perform the same validation steps as the previous lab for validating
  the successful transfer of student1.com to DNS Express
* View the details of the zone in the GUI
* Issue the following command from the ssh console:

.. admonition:: TMSH

   tmsh show ltm dns zone student1.com | more

* Dump the dns express output to see the records

.. code-block:: console

    dnsxdump | more

* Verify logs in ``/var/log/ltm``
* From a command prompt on your jumpbox, issue a query to the external
  listener for a record in the zone

.. code-block:: console

    dig @203.0.113.8 SOA student1.com

* Add a new record to the Student1.com zone in ZoneRunner
* In the GUI, navigate to: **DNS > Zones: ZoneRunner > Resource Record List.**
* Select View Name -> external
* Select Zone Name -> student1.com.
* Click **Create**
* Enter a new A record similar to the figure below for your zone and
  click **Finished**.

|image8|

* Validate the DNS Express was updated by performing a dnsxdump and/or
  query for your new record to the Listener.

* Add another record using the steps above for **www2.student1.com**
  with IP address of **10.41.3.2** but before doing this, make sure to
  have a putty session open to your BIG-IP1 and tail the logs using
  ``tail –f /var/log/ltm`` to view the changes. By making a change to the
  zone on the Hidden Master (in this case ZoneRunner), you will see a
  proactive update to DNS Express via a NOTIFY. Watch the ``/var/log/ltm``
  file to see the update occur. The logs should look something like
  this:

.. code-block:: console

   Jun 5 08:21:26 bigip1 notice zxfrd[6429]: 0153101c:5: Handling NOTIFY for zone student1.com.
   Jun 5 08:21:26 bigip1 debug zxfrd[6429]: 01531008:7: Resetting transfer state for zone student1.com.
   Jun 5 08:21:26 bigip1 debug zxfrd[6429]: 01531023:7: Scheduling zone transfer in 5s for student1.com from 127.0.0.1.
   Jun 5 08:21:26 bigip1 debug zxfrd[6429]: 01531027:7: Notify response to ::1 succeeded (81:na).
   Jun 5 08:21:31 bigip1 notice zxfrd[6429]: 0153101f:5: IXFR Transfer of zone student1.com from 127.0.0.1 succeeded.

Issue a ``dnsxdump | more`` command for the SSH console or a query to the
listener to validate the zone file has updated.

.. |image5| image:: /_static/class2/image8.png
   :width: 3.13333in
   :height: 1.40000in
.. |image6| image:: /_static/class2/image9.png
   :width: 5.31042in
   :height: 6.32847in
.. |image7| image:: /_static/class2/image10.png
   :width: 4.03000in
   :height: 3.21000in
.. |image8| image:: /_static/class2/image11.png
   :width: 3.95000in
   :height: 2.51000in
