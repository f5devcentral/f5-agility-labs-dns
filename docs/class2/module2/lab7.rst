Results
##################################

#. From the jumpbox open a command prompt, perform several recursive queries to your new listener to test.

   Repeat some of the same queries multiple times

   .. code-block:: console

      dig www.f5.com
      dig www.wikipedia.org
      dig www.ncsu.edu
      dig www.example.com

#. Viewing Cache Entries

   Navigate to: **DNS  ››  Caches : Cache List  ››  Properties : transparent_cache**

   .. image:: /_static/class2/router01_cache_select_statistics.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/properties.jsp?name=%2FCommon%2Ftransparent_cache

   Navigate to: **Statistics  ››  Module Statistics : DNS : Caches  ››  Caches**

   .. image:: /_static/class2/router01_cache_click_view.png

   Navigate to: **Statistics  ››  Module Statistics : DNS : Caches  ››  Caches : transparent_cache**

   .. image:: /_static/class2/router01_cache_view_details.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/stats_detail.jsp?name=/Common/transparent_cache

   .. admonition:: TMSH

      tmsh show ltm dns cache records rrset cache transparent_cache

   .. image:: /_static/class2/tmsh_show_ltm_dns_cache_records.png

   .. admonition:: TMSH

      show ltm dns cache transparent transparent_cache

#. Clearing Entire Cache

   Navigate to **Statistics > Module Statistics > DNS > Caches**

   Set "Statistics Type" to "Caches".

   Select the cache and click "Clear Cache" to empty the cache.

