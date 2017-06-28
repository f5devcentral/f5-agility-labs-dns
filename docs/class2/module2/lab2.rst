Resolver Cache
---------------

In this use case, you will configure GTM as a resolver cache which
eliminates the need for the pool of resolvers.
* Estimated completion time: 10 minutes

|image20|

Create a new DNS Cache
~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Caches > Cache List: Create**

* Create a new DNS Cache as shown in the table below.

*Keep the defaults if not noted in the table.*

+---------------------+------------------+
| **Name**            | resolver-cache   |
+=====================+==================+
| **Resolver Type**   | Resolver         |
+---------------------+------------------+

Create a new DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Delivery > Profiles > DNS: Create**.
  Create a new DNS profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------------------+-----------------------------------+
| **Name**                           | Resolver                          |
+====================================+===================================+
| **DNSSEC**                         | Disabled                          |
+------------------------------------+-----------------------------------+
| **GSLB**                           | Disabled                          |
+------------------------------------+-----------------------------------+
| **DNS Express**                    | Disabled                          |
+------------------------------------+-----------------------------------+
| **DNS Cache**                      | Enabled                           |
+------------------------------------+-----------------------------------+
| **DNS Cache Name**                 | resolver-cache                    |
+------------------------------------+-----------------------------------+
| **Unhandled Query Action**         | Drop                              |
+------------------------------------+-----------------------------------+
| **Use BIND Server on Big-IP**      | Disabled                          |
+------------------------------------+-----------------------------------+
| **Logging**                        | Enabled                           |
+------------------------------------+-----------------------------------+
| **Logging Profile**                | dns-logging //from previous lab   |
+------------------------------------+-----------------------------------+
| **AVR Statistics Sampling Rate**   | Enabled; 1/1 queries sampled      |
+------------------------------------+-----------------------------------+

Edit DNS Listener
~~~~~~~~~~~~~~~~~

We will now apply the new profile to the existing DNS Listener.

* In the GUI, navigate to: **DNS > Delivery > Listeners > Listener List**
* Select ‘resolver-listener’ and modify the following settings.
* Change the DNS profile to ‘resolver’ and uncheck “Address
  Translation” (under Listener Advanced options). Click **Update**.
* Select “Load Balancing” from the middle menu above, and Select the
  Default Pool as “None” and click **Update**.
* Your Listener should now be setup as a caching resolver.
* From your workstation command prompt, perform several recursive
  queries to your external Listener to test. You will want to repeat
  some of the same queries multiple times. We are attempting to see
  cache hits and perform recursive queries. Below are some examples:

.. code-block:: console

 dig @10.128.10.54 www.cnn.com
 dig @10.128.10.54 www.google.com
 dig @10.128.10.54 www.umich.edu

**Viewing Cache Statistics**

* In the SSH shell, type the following command:

.. code-block:: console

   tmsh show ltm dns cache resolver resolver-cache | more


Your output should look similar to below with statistics. Bits
In/Out, Packets In/Out and Connections are of particular interest.

|image21|

.. |image20| image:: /_static/class2/image23.png
   :width: 4.58264in
   :height: 2.95764in
.. |image21| image:: /_static/class2/image24.png
   :width: 5.76000in
   :height: 3.47000in
