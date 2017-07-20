gtm1.site1
###############################################

All GTM devices need to be defined. Create a server object for gtm1.site1

.. image:: /_static/class1/server_create_none.png

Click "Create" to define gtm1.site1 as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "gtm1.site1_server"
   "Data Center", "site1_datacenter"
   "Devices Add:", "gtm1.site1.example.com : 203.0.113.7"
   "Health Monitors", "bigip"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/gtm1-click_add.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/gtm1_click-addserver.png

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/gtm1.site1_create.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server gtm1.site1_server datacenter site1_datacenter devices add { gtm1.site1.example.com { addresses add { 203.0.113.7 } } } monitor bigip product bigip
