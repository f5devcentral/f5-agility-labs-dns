site2_ha-pair
###############################################

Contiue the same configuration for the BIG-IP cluster in site 2.

.. image:: /_static/class1/server_create_gtm1-gtm2-site1-hapair.png
   :align: left

|site1-create_site1_ha-pair_link|

.. |site1-create_site1_ha-pair_link| raw:: html

   On gtm1.site<b>1</b> <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp" target="_blank">create a server object</a> according the table below:

.. csv-table::
   :header: "Field", "Value"
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
      :align: left

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site2_ha_pair_bigip1_add.png
      :align: left

#. Click "Add" again to define the other BIG-IP in the HA pair.

   .. image:: /_static/class1/site2_click-addserver_again.png
      :align: left

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site2_ha_pair_bigip2_add.png
      :align: left

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/site2-HA_pair_create.png
      :align: left

#. Make sure to enable both "Virtual Server" and "Link" discovery

   .. image:: /_static/class1/VS_and_link_auto_discovery.png
      :align: left

.. admonition:: TMSH

   tmsh create gtm server site2_ha-pair datacenter site2_datacenter devices add { bigip1.site2.example.com { addresses add { 198.51.100.37 { } } } bigip2.site2.example.com { addresses add { 198.51.100.38 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
