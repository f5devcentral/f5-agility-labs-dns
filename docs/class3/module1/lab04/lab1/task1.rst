gtm1.SITE1
###############################################

The first server we will create is that of gtm1.site1. It is required that we add both gtm1.site1 and gtm1.site2 to establish confgiuration synchronization between them.

|site1-create_gtm1.SITE1_link|

.. |site1-create_gtm1.SITE1_link| raw:: html

   On gtm1.site<b>1</b> <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp" target="_blank">create a server object</a> according the table below:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "gtm1.site1_server"
   "Data Center", "site1_datacenter"
   "Devices Add:", "gtm1.site1.example.com : 203.0.113.7"
   "Health Monitors", "bigip"

#. Fill in the Name and Datacenter

   .. image:: ../../../media/gtm1-click_add.png
      :align: left

#. Click the "Add" button to define IP addresses

   .. image:: ../../../media/gtm1_click-addserver.png
      :align: left

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: ../../../media/gtm1.site1_create.png
      :align: left

.. admonition:: TMSH

   tmsh create gtm server gtm1.site1_server datacenter site1_datacenter devices add { gtm1.site1.example.com { addresses add { 203.0.113.7 } } } monitor bigip product bigip
