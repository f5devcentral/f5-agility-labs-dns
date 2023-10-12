dns.siteb
###############################################

All GTM devices need to be defined. Create a server object for dns.siteb

.. image:: /_static/class1/server_create_gtm1.png

Click "Create" to define dns.siteb as defined in the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "dns.siteb_server"
   "Data Center", "siteb_datacenter"
   "Devices Add:", "dns.siteb.f5demo.com : 10.1.60.101"
   "Health Monitors", "bigip"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/gtm2-click_add.png

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/gtm2_click-addserver.png

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/gtm1.site2_create.png

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp

.. admonition:: TMSH

   tmsh create gtm server dns.siteb_server datacenter siteb_datacenter devices add { dns.siteb.f5demo.com { addresses add { 10.1.60.100 } } } monitor bigip product bigip
