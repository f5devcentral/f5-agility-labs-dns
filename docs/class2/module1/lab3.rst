Slave from DNS Express
----------------------

In this use-case, we will obtain a zone transfer from another F5’s
DNS Express. This is a common deployment in a hybrid on-premise and
cloud-based DNS solution. Our purpose here is to focus on DNS Express
serving zone transfer clients. Note that zones can be signed during a
transfer – but this is outside the scope of this lab

* Estimated completion time: 10 minutes

Create a new DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Delivery > Profiles > DNS: Create.**
  Create a new DNS profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------------------+--------------------------------+
| **Name**                           | AuthNS-hybrid                  |
+====================================+================================+
| **Unhandled Query Action**         | Drop                           |
+------------------------------------+--------------------------------+
| **Use BIND Server on Big-IP**      | Disabled                       |
+------------------------------------+--------------------------------+
| **Zone Transfer**                  | Enabled                        |
+------------------------------------+--------------------------------+
| **Logging**                        | Enabled                        |
+------------------------------------+--------------------------------+
| **Logging Profile**                | dns-logging                    |
+------------------------------------+--------------------------------+
| **AVR Statistics Sampling Rate**   | Enabled; 1/1 queries sampled   |
+------------------------------------+--------------------------------+

* For lab purposes, we are going to use sample all DNS queries with
  AVR.

.. NOTE:: Production sampling rates would be a much lower rate.

Edit DNS Listeners
~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Delivery > Listeners > Listener List**
* Edit the internal-listener-TCP to use the AuthNS-hybrid DNS profile.
* Click **Update** to finish.

Create Nameservers for Zone Transfer Clients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Your lab environment has a second pre-configured BIG-IP (BIGIP2) that
  we will use as the on-prem DNS Express Master.
* In the GUI, navigate to: **DNS > Delivery > Nameservers > Nameserver List: Create**
* Create BIGIP2’s F5 as a Nameserver as shown in the table below. You
  will use the Internal SelfIP/Listener.

*Keep the defaults if not noted in the table.*

+---------------+------------------+
| **Name**      | On-prem-master   |
+===============+==================+
| **Address**   | 10.128.20.230    |
+---------------+------------------+

Edit Student2 Zones on BIGIP2 to allow Zone transfers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Log in to BIGIP2 (shortcut located on desktop) using a new browser
  window with the following credentials:
* https://10.128.1.235
* User: *admin* Pass: *admin*
* In the GUI, navigate to: **DNS > Zones > Zones > Zone List**
* Edit the existing student2.com zone.
* Under Zone Transfer Clients, move **BIGIP1** (pre-defined to save
  time) to Active and **Update**.

.. NOTE:: The internal TCP listener on BIGIP2 is using the
   AuthNS-hybrid profile which is setup exactly like the profile with
   the same name on BIGIP1. ‘Zone Transfer = Enabled’ must be set in the
   profile on the source for this to work correctly.

* Return to your BIGIP1 browser session

Add Student2.com zone to DNS Express on BIGIP1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* In the GUI on BIGIP1, navigate to: **DNS > Zones > Zones > Zone List: Create**
* Create the “student2.com” zone as shown in the figure below and then
  click Finished. Your GTM is acting as a zone transfer client in this
  case (looking to receive a transfer of the on-prem student2.com local
  zone). This example shows BIGIP1 adding the student2.com zone to pull
  from DNS Express on BIGIP2.

|image9|

* Perform the same validation steps as the previous lab for validating
  the successful transfer of student2.com zone
* View the details of the zone in the GUI
* Issue a ``dnsxdump | more`` command from SSH console
* Verify logs in ``/var/log/ltm``
* Issue a query to the external listener for a record in the zone

.. code-block:: console

   dig @203.0.113.8 SOA student2.com

* Open putty sessions to both BIGIP1 and BIGIP2 and tail the logs using
  ``tail –f /var/log/ltm``. This will allow us to see the process of
  adding a new record on the Master on-prem server (BIGIP2) and then it
  being replicated first to DNS Express on its own box, followed by an
  update to the cloud GTM (BIGIP1) in this scenario.

* Add a new record to the student2.com zone in ZoneRunner on **BIGIP2**
* In the GUI, navigate to: **DNS > Zones: ZoneRunner > Resource Record List**
* Select View Name -> external
* Select Zone Name -> student2.com.
* Click **Create**
* Enter a new A record based on the picture below and click
  **Finished**.

|image10|

* Notice the logs in each F5. You will see BIGIP2 perform a zone transfer
  from ZR after receiving a NOTIFY. You will then see BIGIP1
  receive a NOTIFY and obtain a zone transfer.
* Notice that we didn’t have to tell GTM where to send a NOTIFY. Those
  messages are automatically sent to the Zone Transfer Clients
  configured for the zone.
* Issue the following command from SSH console on BIGIP1 to see the
  status and statistics related to the zone.
  *Take note of the “Notifies Received” counter.*

.. code-block:: console

   tmsh show ltm dns zone student2.com | more

* Issue the following command from SSH console on BIGIP2 to see the
  status and statistics related to the zone.
  *Take note of the “Notifies To Client” counter.*

.. code-block:: console

   tmsh show ltm dns zone student2.com | more

* Validate DNS Express was updated by performing a ``dnsxdump | more``
  and/or query for your new record to the Listener.

**Close out your browser session to BIGIP2, we will no longer be using it.**

.. |image9| image:: /_static/class2/image12.png
   :width: 3.95000in
   :height: 2.97000in
.. |image10| image:: /_static/class2/image13.png
   :width: 3.64000in
   :height: 2.46000in
