FQDN
==============================

F5 refers to an FQDN as a "wide-ip", or "wip".

Navigate to: **DNS  ››  GSLB : Wide IPs : Wide IP List**

.. image:: /_static/class1/gtm_wideip_list.png

Create an F5 "wide IP"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "www.wip.f5demo.com"
   "Type", "A"
   "Pool", "www.f5demo.com_pool"

.. image:: /_static/class1/gtm_wideip_create.png

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/list.jsp

TMSH command to run on only dns.sitea:

.. admonition:: TMSH

   tmsh create gtm wideip a www.wip.f5demo.com { pools add { www.f5demo.com_pool { order 0 } } }
