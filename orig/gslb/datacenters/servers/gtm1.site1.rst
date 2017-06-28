###############################################
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

.. figure:: ./images/gtm1.site1_create.png

TMSH Command:

create gtm server gtm1.site1_server  datacenter site1_datacenter devices add { gtm1.site1.example.com { addresses add { 203.0.113.7 } } } monitor bigip product bigip

