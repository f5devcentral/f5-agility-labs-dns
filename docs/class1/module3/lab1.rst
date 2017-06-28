Servers
==============================

Navigate to: **DNS  ››  GSLB : Servers : Server List**
https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp

.. figure:: /_static/class1/gslb_servers_flyout.png
   :width: 800

gtm1.site1
###############################################

Navigate to: **DNS  ››  GSLB : Servers : Server List**
https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp

Create a Server Object as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "gtm1.site1_server"
   "Data Center", "site1_datacenter"
   "Devices Add:", "gtm1.site1.example.com : 203.0.113.7"
   "Health Monitors", "bigip"
   "**Virtual Server Discovery**", "**Disabled**"

.. figure:: /_static/class1/gtm1.site1_create.png
   :width: 800

TMSH command for only site1.gtm1:

.. admonition:: TMSH

   tmsh create gtm server gtm1.site1_server  datacenter site1_datacenter devices add { gtm1.site1.example.com { addresses add { 203.0.113.7 } } } monitor bigip product bigip

gtm1.site2
###############################################

Navigate to: **DNS  ››  GSLB : Servers : Server List**
https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp

Create a Server Object as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "gtm1.site2_server"
   "Data Center", "site2_datacenter"
   "Devices Add:", "gtm1.site2.example.com : 198.51.100.39"
   "Health Monitors", "bigip"
   "Virtual Server Discovery", "Enabled"

.. figure:: /_static/class1/gtm1.site2_create.png
   :width: 800

TMSH command for only gtm1.site1:
.. code-block:: cli

   tmsh create gtm server gtm1.site2_server datacenter site2_datacenter devices add { gtm1.site2.example.com { addresses add { 198.51.100.39 } } } monitor bigip product bigip

site1_ha-pair
###############################################

* Navigate to: **DNS > GSLB > Servers > Server List: Create**
  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp

* Create a Server Object as defined in the table and diagram below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "site1_ha-pair"
   "Data Center", "site1_datacenter"
   "Devices Add:", "bigip1.site1.example.com : 203.0.113.5"
   "Devices Add:", "bigip2.site1.example.com : 203.0.113.6"
   "Health Monitors", "bigip"
   "Virtual Server Discovery", "Enabled"
   "Link Discovery", "Enabled"

.. image:: /_static/class1/site1_ha-pair.png
   :width: 800

TMSH command for only gtm1.site1:

.. admonition:: TMSH

    tmsh create gtm server site1_ha-pair datacenter site1_datacenter devices add { bigip1.site1.example.com { addresses add { 203.0.113.5 { } } } bigip2.site1.example.com { addresses add { 203.0.113.6 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled

site2_ha-pair
###############################################

* Navigate to: **DNS > GSLB > Servers > Server List: Create**
  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp

* Create a Server Object as defined in the table and diagram below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "site2_ha-pair"
   "Data Center", "site2_datacenter"
   "Device Add:", "bigip1.site2.example.com : 198.51.100.37"
   "Device Add:", "bigip2.site2.example.com : 198.51.100.38"
   "Health Monitors", "bigip"
   "Virtual Server Discovery", "Enabled"
   "Link Discovery", "Enabled"

.. image:: /_static/class1/site2_ha-pair.png
   :width: 800

TMSH command for only gtm1.site1:

.. admonition:: TMSH

   tmsh create gtm server site2_ha-pair datacenter site2_datacenter devices add { bigip1.site2.example.com { addresses add { 198.51.100.37 { } } } bigip2.site2.example.com { addresses add { 198.51.100.38 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
