Results
=================================

#. From the Windows command prompt type "dig www.example.com"

   .. image:: /_static/class1/dc01_new_delegation_create_cname_results.png

#. Navigate to gtm1.site1: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.gslb.example.com : A**

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

   Observe the statistics.

#. Navigate to gtm1.site2: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.gslb.example.com : A**

   https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/globallb/stats/wideip/stats_detail.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com+%3A+A

   Observe the statistics.

#. Disable physical interfaces on gtm1.site2:

   https://gtm1.site2.example.com/tmui/Control/form?__handler=/tmui/locallb/network/interface/list&__source=disable&__linked=false&__fromError=false

   .. image:: /_static/class1/


TODO: add more results
