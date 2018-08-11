FQDN
==============================

F5 refers to an FQDN as a "wide-ip", or "wip". The Wide IP maps a FQDN (fully qualified domain name) to one or more pools of virtual servers. For more information on Wide IPs, please refer to the link below.

|wip_link|

.. |wip_link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-concepts-12-0-0/5.html" target="_blank">More information on Wide IPs</a>


|site1_wideip_create_link|

.. |site1_wideip_create_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/create.jsp" target="_blank">DNS  ››  GSLB : Wide IPs : Wide IP List</a>
   
.. image:: /_static/class1/gtm_wideip_list.png
   :align: left

Create an F5 "wide IP" according to the following table:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "www.example.com"
   "Type", "A"
   "Alias List", "www.gslb.example.com"
   "Load-Balancing Decision Log - Pool Selection", "Checked"
   "Load-Balancing Decision Log - Pool Traversal", "Checked"
   "Load-Balancing Decision Log - Pool Member Selection", "Checked"
   "Load-Balancing Decision Log - Pool Member Traversal", "Checked"
   "Pool", "www.example.com_pool"


.. image:: /_static/class1/gtm_wideip_create.png
   :align: left

TMSH command to run on only gtm1.site1:

.. admonition:: TMSH

   tmsh create gtm wideip a www.example.com { pools add { www.example.com_pool } aliases add { www.gslb.example.com } load-balancing-decision-log-verbosity {  pool-member-selection pool-member-traversal pool-selection pool-traversal } }

**Results**

Use the "dig" command to query directly to the GTM to test the configuration. DIG will bypass locally configured DNS servers when specifying an "@203.0.113.8" argument.

From the Jumpbox use "dig" from the CMD prompt. The first command below will query 203.0.113.8 for the A record of www.example.com, then query @203.0.113.8 for www.gslb.example.com.

.. note::  **Your result may differ from below**

.. image:: /_static/class2/dns_gslb_site1_widepip_results.png
   :align: left

|site1_wideip_statistics-flyout_link|

.. |site1_wideip_statistics-flyout_link| raw:: html

   On gtm1.site<b>1</b> <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats.jsp" target="_blank">view statistics</a>
   
.. image:: /_static/class2/gtm_wideip_statistics_flyout.png
   :align: left

|site1_wideip_statistics-detail_link|

.. |site1_wideip_statistics-detail_link| raw:: html

   <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=/Common/www.example.com&type=1&identity=www.example.com : A" target="_blank">For more details click "View"</a>

.. image:: /_static/class2/gtm_wideip_statistics.png
   :align: left

.. admonition:: TMSH

   tmsh show gtm wideip A www.example.com detail

.. image:: /_static/class2/gtm_wideip_tmsh-show.png
   :align: left

.. admonition:: TMSH

   tail -f /var/log/ltm

.. image:: /_static/class2/tail_var_log_ltm.png
   :align: left
