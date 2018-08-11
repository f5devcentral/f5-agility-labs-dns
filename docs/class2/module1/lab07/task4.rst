Results
==============================

From the Jumpbox use "dig" from the CMD prompt

Do not specifing an IP address to the dig command, DNS requests will use the locally configured DNS server (the DC01 server).

The results will be similar to that of the image below. The first request for the CNAME www.example.com was resolved to a CNAME of www.gslb.example.com, and the DNS server also inserts the resolved CNAME to 203.0.113.9; the IP address of gtm1.site1. A subsequent DNS query resolved to 198.51.100.41 which follow the round-robin algorithm configured on the pool.

.. image:: /_static/class2/jumpbox_dig_wwwexamplecom.png
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

.. note:: Geographically redundant Web service by using BIG-IP DNS have been configured. **Great job!**

.. admonition:: TMSH

   tmsh show gtm wideip A www.example.com detail

.. image:: /_static/class2/gtm_wideip_tmsh-show.png
   :align: left

.. admonition:: TMSH

   tail -f /var/log/ltm

.. image:: /_static/class2/tail_var_log_ltm.png
   :align: left
