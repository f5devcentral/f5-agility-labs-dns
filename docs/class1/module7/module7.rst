Results
=================================

#. From the Workstation command prompt type "dig www.f5demo.com"

   .. image:: /_static/class1/dc01_new_delegation_create_cname_results.png

#. Observe WIDEIP statistics on dns.sitea: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.wip.f5demo.com : A**

 ..  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_flyout.png

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_detail.png

   .. admonition:: TMSH

      tmsh show gtm wideip a www.wip.f5demo.com

#. Observe WIDEIP statistics on dns.siteb: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.wip.f5demo.com : A**

 ..  https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

#. Disable physical interfaces on dns.siteb:

 ..  https://gtm1.site2.example.com/tmui/Control/form?__handler=/tmui/locallb/network/interface/list&__source=disable&__linked=false&__fromError=false

   .. image:: /_static/class1/gtm1_site1_disable_interfaces.png

   TMSH command to run on only dns.siteb:

   .. admonition:: TMSH
   
      tmsh modify net interface all disabled

#. Refresh statistics on dns.sitea and make sure DNS requests are still resolving.

 ..  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

#. Re-enable interfaces on dns.siteb, disable interfaces on dns.sitea.
   Observe statistics on dns.siteb and make sure DNS requests are still resolving.

   TMSH command to run on only dns.siteb:

   .. admonition:: TMSH
   
      tmsh modify net interface all enabled

#. Observe pool statistics on dns.siteb: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Pools : www.f5demo.com_pool : A**

 ..  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/pool/stats_detail.jsp?name=%2FCommon%2Fwww.example.com_pool&pool_type=1&identity=www.example.com_pool+%3A+A

   .. image:: /_static/class1/results_pool_statistics.png
      :width: 800

   .. admonition:: TMSH

      show gtm pool a www.f5demo.com_pool

#. Using Putty, ssh into dns.sitea and run the following command to watch logs:

   .. admonition:: TMSH

      tail -f /var/log/ltm 

