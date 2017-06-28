FQDN
==============================

F5 refers to an FQDN as a "wide-ip", or "wip".

Navigate to: **DNS  ››  GSLB : Wide IPs : Wide IP List**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/list.jsp

Create an F5 "wide IP"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "www.gslb.example.com"
   "Type", "A"
   "Pool", "www.example.com_pool"

.. image:: /_static/class1/gtm_wideip_list.png
   :width: 800

.. image:: /_static/class1/gtm_wideip_create.png
   :width: 800

TMSH command to run on only gtm1.site1:

.. code-block:: cli

   tmsh create gtm wideip a www.example.com { pools add { www.example.com_pool { order 0 } } }
