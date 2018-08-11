Pools
===========================

Pools are a grouping of related virtual servers. Pools will typically reference virtual servers on BIG-IP LTM systems. The pool we create below will be later referenced by a Wide-IP (FQDN). For more information on pools, please refer to the link below.

|pools_link|

.. |pools_link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-concepts-12-0-0/5.html" target="_blank">More information on BIG-IP DNS Pools</a>


|site1_pool_list_link|

.. |site1_pool_list_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/pool/list.jsp" target="_blank">DNS  ››  GSLB : Pools : Pool List</a>

.. image:: /_static/class1/gtm_pool_list.png
   :align: left

|site1_pool_create_link|

.. |site1_pool_create_link| raw:: html

   On gtm1.site<b>1</b> <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/pool/create.jsp" target="_blank">Create a Pool</a> of LTM Virtuals according to the following table:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "www.example.com_pool"
   "Type", "A"
   "member", "isp1_site1_www.example.com_tcp_https_virtual"
   "member", "isp2_site2_www.example.com_tcp_https_virtual"

.. image:: /_static/class1/create_gtm_pool.png
   :align: left

TMSH command to run on only gtm1.site1:

.. admonition:: TMSH

   tmsh create gtm pool a www.example.com_pool { members add { site1_ha-pair:/Common/isp1_site1_www.example.com_tcp_https_virtual { member-order 0 } site2_ha-pair:/Common/isp2_site2_www.example.com_tcp_https_virtual { member-order 1 } } }
