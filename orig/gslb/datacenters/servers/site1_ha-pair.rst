###############################################
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

.. image:: ./images/site1_ha-pair.png
