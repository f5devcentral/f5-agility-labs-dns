Pools
===========================

LTM virtual server objects are grouped together into GTM pools.

Navigate to: **DNS  ››  GSLB : Pools : Pool List**

.. image:: /_static/class1/gtm_pool_list.png
   :width: 800

Create a Pool of LTM Virtuals according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "www.f5demo.com_pool"
   "Type", "A"
   "member", "app1_sitea_www.f5demo.com_tcp_https_virtual"
   "member", "app2_siteb_www.f5demo.com_tcp_https_virtual"

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/pool/create.jsp

.. image:: /_static/class1/create_gtm_pool.png
   :width: 800

.. admonition:: TMSH - Run on only dns.sitea

   tmsh create gtm pool a www.f5demo.com_pool { members add { sitea_ltm:/Common/app1_sitea_www.f5demo.com_tcp_https_virtual { member-order 0 } siteb_ltm:/Common/app2_siteb_www.f5demo.com_tcp_https_virtual { member-order 1 } } }
