site2_ha-pair
###############################################

LTM devices need to be defined. Create a server object for the bigip1.site2 and bigip2.site2 HA pair

.. image:: /_static/class1/server_create_gtm1-gtm2-site1-hapair.png

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

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/site2_click-addserver.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site2_ha_pair_bigip1_add.png

#. Click "Add" again to define the other BIG-IP in the HA pair.

   .. image:: /_static/class1/site2_click-addserver_again.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site2_ha_pair_bigip2_add.png

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/site2-HA_pair_create.png

#. Make sure to enable both "Virtual Server" and "Link" discovery

   .. image:: /_static/class1/VS_and_link_auto_discovery.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server site2_ha-pair datacenter site2_datacenter devices add { bigip1.site2.example.com { addresses add { 198.51.100.37 { } } } bigip2.site2.example.com { addresses add { 198.51.100.38 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
