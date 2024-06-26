Results
=================================

#. From the Windows 10 Jumpbox command prompt type "dig www.f5demo.com"  Repeat the command several times to see that the name resolution is alternating between 10.1.10.51 and 10.1.60.51.

   .. image:: /_static/class1/dc01_new_delegation_create_cname_results.png
      :width: 800

#. Observe Wide-IP statistics on dns.sitea: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.wip.f5demo.com : A** (Note: The images show the Wide-IP as www.f5demo.com but you will have www.wip.f5demo.com in the lab.  The TMSH commands reference the correct Wide-IP name)

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_flyout.png
      :width: 800

   .. image:: /_static/class1/gtm1_site1_wideip_statistics_detail.png
      :width: 800

   .. admonition:: TMSH

      tmsh show gtm wideip a www.wip.f5demo.com

#. Observe Wide-IP statistics on dns.siteb: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Wide IPs : www.wip.f5demo.com : A**

#. Disable physical interfaces on dns.siteb:

   .. image:: /_static/class1/gtm1_site1_disable_interfaces.png
      :width: 800

   .. admonition:: TMSH - run on only dns.siteb
   
      tmsh modify net interface all disabled

#. Refresh statistics on dns.sitea and make sure DNS requests are still resolving.

#. Re-enable interfaces on dns.siteb, disable interfaces on dns.sitea.
   Observe statistics on dns.siteb and make sure DNS requests are still resolving.

   .. admonition:: TMSH - run on only dns.siteb
   
      tmsh modify net interface all enabled

#. Observe pool statistics on dns.siteb: **Statistics  ››  Module Statistics : DNS : GSLB  ››  Pools : www.f5demo.com_pool : A**

   .. image:: /_static/class1/results_pool_statistics.png
      :width: 800

   .. admonition:: TMSH

      show gtm pool a www.f5demo.com_pool

#. Re-enable interfaces on dns.sitea

   .. admonition:: TMSH
   
      tmsh modify net interface all enabled

#. Using Puttyon the Jumpbox, ssh into dns.sitea and run the following command to watch logs (use password 'F5demo!!' if prompted:

   .. admonition:: TMSH

      tail -f /var/log/ltm 

