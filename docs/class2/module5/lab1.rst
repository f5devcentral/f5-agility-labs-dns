DNSSEC Validating Resolver
---------------------------

In this use case, you will configure GTM as a DNSSEC validating
resolver which offloads heavy CPU computation to traditional
resolvers. This simply adds DNSSEC validation to the resolver-cache
use-case previously configured.
* Estimated completion time: 10 minutes

Create a new DNS Cache
~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Caches > Cache List: Create**
* Create a new DNS cache as shown in the table below.

*Keep the defaults if not noted in the table.*

+---------------------+-----------------------+
| **Name**            | validating-resolver   |
+=====================+=======================+
| **Resolver Type**   | Validating Resolver   |
+---------------------+-----------------------+

* A Trust Anchor must be configured so that the validating resolver has
  a starting point for validation. This can be done manually via the SSH console.
  You can obtain the root server DS keys by using dig and its related
  utilities as follows:

.. NOTE:: In the interest of time, the trust anchors are located on your
   desktop as a text file named TrustAnchors.txt. You can simply cut
   and paste the values into the GUI. If you want to run the
   utilities to obtain the anchors, the commands are below for your
   reference.

* Get the root name servers in DNSKEY format and output to the file "root-dnskey"

.. code-block:: console

   dig +multi +noall +answer DNSKEY . >root-dnskey

* Convert the root trust anchors from DNSKEY format to DS

.. code-block:: console

   dnssec-dsfromkey -f root-dnskey . >root-ds

* Output of the root DS keys

.. code-block:: console

   cat ./root-ds

   IN DS 19036 8 1 B256BD09DC8DD59F0E0F0D8541B8328DD986DF6E

   IN DS 19036 8 2
   49AAC11D7B6F6446702E54A1607371607A1A41855200FD2CE1CDDE32 F24E8FB5

* Each of the 2 lines in the TrustAnchor.txt file should be entered as
  a new trust anchor (2 total).
* In the GUI, navigate to: **DNS > Caches > Cache List**. Select
  “validating-resolver” and click on **Trust Anchors** on the top
  menu. Click **Add**. Copy each line from the TrustAnchor.txt file
  as a Trust Anchor entry. You should end with a total of two
  entries.
* The figure below shows what your configuration should look like.

|image22|

Create a new DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will create a dns profile to be used by a listener for DNSSEC validation.
* In the GUI, navigate to: **DNS > Delivery > Profiles > DNS: Create**.
* Create a new DNS profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------------------+-----------------------------------+
| **Name**                           | Validating                        |
+====================================+===================================+
| **DNSSEC**                         | Disabled                          |
+------------------------------------+-----------------------------------+
| **GSLB**                           | Disabled                          |
+------------------------------------+-----------------------------------+
| **DNS Express**                    | Disabled                          |
+------------------------------------+-----------------------------------+
| **DNS Cache**                      | Enabled                           |
+------------------------------------+-----------------------------------+
| **DNS Cache Name**                 | validating-resolver               |
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
* Select ‘\ **resolver-listener**\ ’ and modify the DNS Profile to use “\ **validating**\ ”.
* Your Listener should now be setup as a validating resolver.
* **Use-Case: Valid Signed Zone.** From your workstation, perform
  several recursive queries to your external Listener to test. Perform the following command
  2 or 3 times:

.. code-block:: console

   dig @10.128.10.54 internetsociety.org

* In the SSH shell, type the following:

.. admonition:: TMSH

   tmsh show ltm dns cache validating-resolver | more

Your output should look similar to below with statistics. Response
Validation and DNSSEC Key stats are of particular interest in this use-case.

|image23|

* In the GUI, you can find similar data as above by navigating
  **Statistics > Module Statistics > DNS > Caches**.
* Select “Statistics Type” of Caches.
* Select “View” under the Details column for validating-resolver
* Note the size of the cache for just this single RR query. You can
  view what’s in the cache from the CLI with:

.. admonition:: TMSH

   tmsh show ltm dns cache records rrset cache validating-resolver | more

* **Use-Case: Invalid Signed Zone:** From your workstation, perform
  several recursive queries to your external Listener to test. Perform the
  following command 2 or 3 times:

.. code-block:: console

   dig @10.128.10.54 dnssec-failed.org

* Run the same steps above to view statistics and see the difference
* What happens when trust is broken.
* What statistic incremented?
* What was the query response to the client?

.. |image22| image:: /_static/class2/image25.png
   :width: 4.00694in
   :height: 1.06042in
.. |image23| image:: /_static/class2/image26.png
   :width: 5.76000in
   :height: 3.47000in
