Transparent Caching
-------------------

Create a DNS Cache
~~~~~~~~~~~~~~~~~~

Log into the gateway device router01.brancho1 in the **branch office**

Navigate to **DNS  ››  Caches : Cache List**

https://router.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/list.jsp

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "transparent_cache"
   "Resolver Type", "Transparent"

.. image:: /_static/class2/cache_transparent.png
   :width: 800

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns cache transparent transparent_cache

Create a logging profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Configure DNS query and response logging.

Navigate to **Local Traffic  ››  Profiles : Other : DNS Logging**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns_log/list.jsp

Create a DNS logging profile as shown in the table below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example_dns_logging_profile"
   "Log Publisher", "sys-db-access-publisher"
   "Log Responses", "enabled"
   "Include Query ID", "enabled"

.. image:: /_static/class2/dns_cache_transparent_flyout_router01.png
   :width: 800

.. image:: /_static/class2/dns_cache_transparent_create_router01.png
   :width: 800

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm profile dns-logging  example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-db-publisher

Create a DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Profiles : Services : DNS**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns/list.jsp

Create a DNS profile as shown in the table below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_profile"
   "DNS Cache", "Enabled"
   "DNS Cache Name", "transparent_cache"
   "Unhandled Query Action", "Drop"
   "Use BIND Server on Big-IP", "Disabled"
   "Logging", "Enabled"
   "Logging Profile", "example_dns_logging_profile"
   "AVR statistics Sample Rate", "Enabled, 1/1 queries sampled"

.. image:: /_static/class2/router01_ltm_profile_dns.png
   :width: 800

.. image:: /_static/class2/dns_profile_settings_router01.png
   :width: 800

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm profile dns example.com_dns_profile use-local-bind no unhandled-query-action drop log-profile example_dns_logging_profile enable-logging yes avr-dnsstat-sample-rate 1

Create a UDP Profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Profiles : Protocol : UDP**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/udp/list.jsp?

Create a UDP profile as shown in the following table.
 
.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_udp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. image:: /_static/class2/router01_create_udp_profile.png
   :width: 800

.. image:: /_static/class2/router01_create_udp_profile_properties.png
   :width: 800

.. admonition:: TMSH

   tmsh create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns

Create a UDP Virtual
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Virtual Servers : Virtual Server List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/virtual_server/list.jsp?Filter=*

Create a UDP listener.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "branch01_udp_53_virtual"
   "Destination", "10.1.70.200:53"
   "Protocol", "UDP"
   "Protocol Profile (Client)", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Address Translation", "unchecked"

.. image:: /_static/class2/router01_create_virtual_flyout.png
   :width: 800

.. image:: /_static/class2/router01_create_virtual_udp_properties.png
   :width: 800

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm virtual branch01_udp_53_virtual destination 10.1.70.200:domain ip-protocol udp mask 255.255.255.255 profiles add { example.com_dns_profile { } example.com_udp-dns_profile { } } translate-address disabled vlans add { branch01_vlan } vlans-enabled

Create a TCP Virtual
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Virtual Servers : Virtual Server List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/virtual_server/list.jsp?Filter=*

Create a TCP listener.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "branch01_tcp_53_virtual"
   "Destination", "10.1.70.200:53"
   "Protocol", "TCP"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Address Translation", "unchecked"

.. image:: /_static/class2/router01_create_virtual_flyout.png
   :width: 800

.. image:: /_static/class2/router01_create_virtual_tcp_properties.png
   :width: 800

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm virtual branch01_tcp_53_virtual destination 10.1.70.200:domain ip-protocol tcp mask 255.255.255.255 profiles add { example.com_dns_profile { } example.com_tcp-dns_profile { } } translate-address disabled vlans add { branch01_vlan } vlans-enabled


https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-cache-implementations-11-3-0/2.html

Results
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From the jumpbox open a command prompt, perform several recursive queries to your new listener to test.

Repeat some of the same queries multiple times

.. code-block:: console

   dig www.f5.com
   dig www.wikipedia.org
   dig www.ncsu.edu
   dig www.example.com

Viewing Cache Entries

Navigate to: **DNS  ››  Caches : Cache List  ››  Properties : transparent_cache** 

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/properties.jsp?name=%2FCommon%2Ftransparent_cache

.. image:: /_static/class2/router01_cache_select_statistics.png
   :width: 800

Navigate to: **Statistics  ››  Module Statistics : DNS : Caches  ››  Caches**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/stats.jsp?name=%2FCommon%2Ftransparent_cache&tab=dns_cache_transparent_config

.. image:: /_static/class2/router01_cache_click_view.png
   :width: 800

Navigate to: **Statistics  ››  Module Statistics : DNS : Caches  ››  Caches : transparent_cache**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/stats_detail.jsp?name=/Common/transparent_cache

.. image:: /_static/class2/router01_cache_view_details.png
   :width: 800

.. admonition:: TMSH

   tmsh show ltm dns cache records rrset cache transparent_cache

.. image:: /_static/class2/tmsh_show_ltm_dns_cache_records.png
   :width: 800


.. admonition:: TMSH

   tmsh show ltm dns cache transparent

.. image:: /_static/class2/tmsh_show_ltm_dns_cache_transparent.png
   :width: 800

* View cache entries for a particular domain / owner:

|image15|

* View cache entries of a particular RR type:

|image16|

* There are other options… feel free to play around and familiarize
  yourself with the options.

**Viewing Cache Statistics**

* In the SSH shell, type:

.. admonition:: TMSH

   tmsh show ltm dns cache transparent transparent-cache

* Your output should look similar to below with statistics showing Hits
  and Misses in particular.

|image17|

* In the GUI, you can find similar data as above by navigating
  **Statistics > Module Statistics > DNS > Caches**.
* Select “Statistics Type” of Caches.
* Select “View” under the Details column for transparent-cache
* Note that stats can also be reset from this view (Reset).

|image18|

* Spend some time looking in the DNS Analytics to verify that AVR is
  graphing query stats as expected.

**Deleting Cache Entries**

* Specific cache entries can be deleted via the TMSH console. Entries
  to be deleted can be filtered by several aspects.
* In the TMSH shell, go to the DNS prompt and type

.. code-block:: console

   delete ltm dns cache records rrset cache transparent_cache ?

* Now delete individual records by type and owner. Below show some
  examples.

|image19|

**Clearing Entire Cache**

* Via the GUI, navigate to **Statistics > Module Statistics > DNS > Caches**
* Set “Statistics Type” to “Caches”.
* You can select the cache and click “Clear Cache” to empty the cache.

.. |image11| image:: /_static/class2/image14.png
   :width: 4.25347in
   :height: 3.55347in
.. |image12| image:: /_static/class2/image15.png
   :width: 4.24000in
   :height: 4.25000in
.. |image13| image:: /_static/class2/image16.png
   :width: 4.71000in
   :height: 6.97000in
.. |image14| image:: /_static/class2/image17.png
   :width: 5.46000in
   :height: 2.55000in
.. |image15| image:: /_static/class2/image18.png
   :width: 5.46000in
   :height: 1.54000in
.. |image16| image:: /_static/class2/image19.png
   :width: 5.46000in
   :height: 1.95000in
.. |image17| image:: /_static/class2/image20.png
   :width: 5.45000in
   :height: 3.26000in
.. |image18| image:: /_static/class2/image21.png
   :width: 3.86667in
   :height: 2.92014in
.. |image19| image:: /_static/class2/image22.png
   :width: 5.87000in
   :height: 3.78000in
