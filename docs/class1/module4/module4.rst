Pools
===========================

LTM virtual server objects are grouped together into GTM pools.

Navigate to: **DNS  ››  GSLB : Pools : Pool List**

.. image:: /_static/class1/gtm_pool_list.png

Create a Pool of LTM Virtuals according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "www.example.com_pool"
   "Type", "A"
   "member", "isp1_site1_www.example.com_tcp_https_virtual"
   "member", "isp2_site2_www.example.com_tcp_https_virtual"

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/pool/create.jsp

.. image:: /_static/class1/create_gtm_pool.png

TMSH command to run on only gtm1.site1:

.. admonition:: TMSH

   tmsh create gtm pool a www.example.com_pool { members add { site1_ha-pair:/Common/isp1_site1_www.example.com_tcp_https_virtual { member-order 0 } site2_ha-pair:/Common/isp2_site2_www.example.com_tcp_https_virtual { member-order 1 } } }
