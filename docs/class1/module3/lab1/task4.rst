site2_ha-pair
###############################################

LTM devices need to be defined. Create a server object for the bigip1.site2 and bigip2.site2 HA pair.

Navigate to: **DNS > GSLB > Servers > Server List: Create**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

Create a Server Object as defined in the table below:

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

TMSH command for only gtm1.site1:

.. admonition:: TMSH

   tmsh create gtm server site2_ha-pair datacenter site2_datacenter devices add { bigip1.site2.example.com { addresses add { 198.51.100.37 { } } } bigip2.site2.example.com { addresses add { 198.51.100.38 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
