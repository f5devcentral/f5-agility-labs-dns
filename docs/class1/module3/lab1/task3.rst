site1_ha-pair
###############################################

LTM devices need to be defined. Create a server object for the bigip1.site1 and bigip2.site1 HA pair

.. image:: /_static/class1/server_create_gtm1-gtm2.png

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

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/site1_click-addserver.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site_ha_pair_bigip1_add.png

#. Click "Add" again to define the other BIG-IP in the HA pair.

   .. image:: /_static/class1/site1_click-addserver_again.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site_ha_pair_bigip2_add.png

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/site1-HA_pair_create.png

#. Make sure to enable both "Virtual Server" and "Link" discovery

   .. image:: /_static/class1/VS_and_link_auto_discovery.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server site1_ha-pair datacenter site1_datacenter devices add { bigip1.site1.example.com { addresses add { 203.0.113.5 { } } } bigip2.site1.example.com { addresses add { 203.0.113.6 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
