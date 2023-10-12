Results
=================================

#. From the Workstation command prompt type "dig www.example.com"

   .. image:: /_static/class1/dc01_new_delegation_create_cname_results.png

#. Observe WIDEIP statistics on gtm1.site1: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.gslb.example.com : A**

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_flyout.png

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_detail.png

   .. admonition:: TMSH

      tmsh show gtm wideip a www.gslb.example.com

#. Observe WIDEIP statistics on gtm1.site2: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.gslb.example.com : A**

   https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

#. Disable physical interfaces on gtm1.site2:

   https://gtm1.site2.example.com/tmui/Control/form?__handler=/tmui/locallb/network/interface/list&__source=disable&__linked=false&__fromError=false

   .. image:: /_static/class1/gtm1_site1_disable_interfaces.png

   TMSH command to run on only gtm1.site2:

   .. admonition:: TMSH
   
      tmsh modify net interface all disabled

#. Refresh statistics on gtm1.site1 and make sure DNS requests are still resolving.

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

#. Re-enable interfaces on gtm1.site2, disable interfaces on gtm1.site1.
   Observe statistics on gtm1.site2 and make sure DNS requests are still resolving.

   TMSH command to run on only gtm1.site2:

   .. admonition:: TMSH
   
      tmsh modify net interface all enabled

#. Observe pool statistics on gtm1.site1: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Pools : www.example.com_pool : A**

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/pool/stats_detail.jsp?name=%2FCommon%2Fwww.example.com_pool&pool_type=1&identity=www.example.com_pool+%3A+A

   .. image:: /_static/class1/results_pool_statistics.png

   .. admonition:: TMSH

      show gtm pool a www.example.com_pool

#. Using Putty, ssh into gtm1.site1 and run the following command to watch logs:

   .. admonition:: TMSH

      tail -f /var/log/ltm 

