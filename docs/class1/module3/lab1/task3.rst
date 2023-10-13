siteA_ltm
###############################################

LTM devices need to be defined. Create a server object for the ltm.siteA 

.. image:: /_static/class1/server_create_gtm1-gtm2.png
   :width: 800

Create a Server Object as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "sitea_ltm"
   "Data Center", "sitea_datacenter"
   "Devices Add:", "ltma.sitea.f5demo.com : 10.1.10.50"
   "Health Monitors", "bigip"
   "Virtual Server Discovery", "Enabled"
   "Link Discovery", "Enabled"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/site1_click-addserver.png
      :width: 800

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site_ha_pair_bigip1_add.png
      :width: 800

.. #. Click "Add" again to define the other BIG-IP in the HA pair.

..   .. image:: /_static/class1/site1_click-addserver_again.png

.. #. Click the "Add" button to define IP addresses

..   .. image:: /_static/class1/site_ha_pair_bigip2_add.png

#. Complete the form and associate the "bigip" "Health Monitor" and enable both "Virtual Server" and "Link" discovery

   .. image:: /_static/class1/site1-HA_pair_create.png
      :width: 800

.. #. Make sure to enable both "Virtual Server" and "Link" discovery

..   .. image:: /_static/class1/VS_and_link_auto_discovery.png

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server sitea_ltm datacenter sitea_datacenter devices add { ltma.sitea.f5demo.com { addresses add { 10.1.10.50 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
