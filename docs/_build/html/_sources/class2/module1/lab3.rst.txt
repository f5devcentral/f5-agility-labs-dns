Results
#################################

#. Navigate to: **DNS  ››  Delivery : Load Balancing : Pools : Pool List**

   Click to select the branch01_dns_pool, and then click "Members"

   .. image:: /_static/class2/class2_cache_listpool_flyout.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/pool/list.jsp

#. Click to select "branch01_dns_pool", and then select "Members"

   .. image:: /_static/class2/class2_click-members_pool.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/pool/resources.jsp?name=/Common/branch01_dns_pool

#. Notice the health status of the existing DNS infrastructure.

   .. image:: /_static/class2/class2_ltmpool_wthone_down_member.png

   .. admonition:: TMSH

      tmsh show ltm pool branch01_dns_pool detail

   .. image:: /_static/class2/class2_dc02_is_down.png
