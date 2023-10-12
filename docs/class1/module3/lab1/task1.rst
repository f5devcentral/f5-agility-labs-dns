dns.sitea
###############################################

All GTM devices need to be defined. Create a server object for dns.sitea

.. image:: /_static/class1/server_create_none.png
   :width: 800

Click "Create" to define dns.sitea as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "dns.sitea_server"
   "Data Center", "sitea_datacenter"
   "Devices Add:", "dns.sitea.f5demo.com : 10.1.10.101"
   "Health Monitors", "bigip"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/gtm1-click_add.png
      :width: 800

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/gtm1_click-addserver.png
      :width: 800

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/gtm1.site1_create.png
      :width: 800

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server dns.sitea_server datacenter sitea_datacenter devices add { dns.sitea.f5demo.com { addresses add { 10.1.10.100 } } } monitor bigip product bigip
