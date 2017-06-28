###############################################
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

.. image:: ./images/site2_ha-pair.png
