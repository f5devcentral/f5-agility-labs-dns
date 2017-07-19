site1_ha-pair
###############################################

LTM devices need to be defined. Create a server object for the bigip1.site1 and bigip2.site1 HA pair.

Navigate to: **DNS > GSLB > Servers > Server List: Create**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

Create a Server Object as defined in the table below:

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

TMSH command for only gtm1.site1:

.. admonition:: TMSH

    tmsh create gtm server site1_ha-pair datacenter site1_datacenter devices add { bigip1.site1.example.com { addresses add { 203.0.113.5 { } } } bigip2.site1.example.com { addresses add { 203.0.113.6 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
