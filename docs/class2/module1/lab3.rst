Results
#################################

#. Navigate to: **DNS  ››  Delivery : Load Balancing : Pools : Pool List**

   .. image:: /class2/media/class2_cache_listpool_flyout.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/pool/list.jsp

#. Click to select "branch01_dns_pool", and then select "Members"

   .. image:: /class2/media/class2_click-members_pool.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/pool/resources.jsp?name=/Common/branch01_dns_pool

#. Notice the health status of the existing DNS infrastructure.

   .. image:: /class2/media/mod1lab3.png

   .. admonition:: TMSH

      tmsh show ltm pool branch01_dns_pool detail

   .. image:: /class2/media/monitors.png
