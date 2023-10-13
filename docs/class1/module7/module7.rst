Results
=================================

#. From the Workstation command prompt type "dig www.f5demo.com"

   .. image:: /_static/class1/dc01_new_delegation_create_cname_results.png
      :width: 800

#. Observe WIDEIP statistics on dns.sitea: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.wip.f5demo.com : A**

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_flyout.png
      :width: 800

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_detail.png
      :width: 800

   .. admonition:: TMSH

      tmsh show gtm wideip a www.wip.f5demo.com

#. Observe WIDEIP statistics on dns.siteb: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.wip.f5demo.com : A**

#. Disable physical interfaces on dns.siteb:

   .. image:: /_static/class1/gtm1_site1_disable_interfaces.png
      :width: 800

   TMSH command to run on only dns.siteb:

   .. admonition:: TMSH
   
      tmsh modify net interface all disabled

#. Refresh statistics on dns.sitea and make sure DNS requests are still resolving.

#. Re-enable interfaces on dns.siteb, disable interfaces on dns.sitea.
   Observe statistics on dns.siteb and make sure DNS requests are still resolving.

   TMSH command to run on only dns.siteb:

   .. admonition:: TMSH
   
      tmsh modify net interface all enabled

#. Observe pool statistics on dns.siteb: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Pools : www.f5demo.com_pool : A**

   .. image:: /_static/class1/results_pool_statistics.png
      :width: 800

   .. admonition:: TMSH

      show gtm pool a www.f5demo.com_pool

#. Re-enable interfaces on dns.sitea

   TMSH command to run on only dns.sitea:

   .. admonition:: TMSH
   
      tmsh modify net interface all enabled

#. Using Putty, ssh into dns.sitea and run the following command to watch logs:

   .. admonition:: TMSH

      tail -f /var/log/ltm 

