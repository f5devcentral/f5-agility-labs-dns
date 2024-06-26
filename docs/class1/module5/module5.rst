FQDN
==============================

F5 refers to an FQDN as a "Wide-IP", or "WIP".

Navigate to: **DNS  ››  GSLB : Wide IPs : Wide IP List**

.. image:: /_static/class1/gtm_wideip_list.png
   :width: 800

Create an F5 "Wide IP"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "www.wip.f5demo.com"
   "Type", "A"
   "Pool", "www.f5demo.com_pool"

.. image:: /_static/class1/gtm_wideip_create.png
   :width: 800

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/list.jsp

.. admonition:: TMSH - Run on dns.sitea

   tmsh create gtm wideip a www.wip.f5demo.com {  pools add { www.f5demo.com_pool { order 0 } } load-balancing-decision-log-verbosity { pool-member-selection pool-member-traversal pool-selection pool-traversal} }
