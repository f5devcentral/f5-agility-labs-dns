gtm1.site2
###############################################

All GTM devices need to be defined. Create a server object for gtm1.site2

.. image:: /_static/class1/server_create_gtm1.png

Click "Create" to define gtm1.site2 as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "gtm1.site2_server"
   "Data Center", "site2_datacenter"
   "Devices Add:", "gtm1.site2.example.com : 198.51.100.39"
   "Health Monitors", "bigip"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/gtm2-click_add.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/gtm2_click-addserver.png

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/gtm1.site2_create.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server gtm1.site2_server datacenter site2_datacenter devices add { gtm1.site2.example.com { addresses add { 198.51.100.39 } } } monitor bigip product bigip
