gtm1.SITE2
###############################################

Continue the same configuration for gtm1.site2.

.. image:: /_static/class1/server_create_gtm1.png
   :align: left

|site1-create_gtm1.SITE2_link|

.. |site1-create_gtm1.SITE2_link| raw:: html

   On gtm1.site<b>1</b> <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp" target="_blank">create a server object</a> according the table below:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "gtm1.site2_server"
   "Data Center", "site2_datacenter"
   "Devices Add:", "gtm1.site2.example.com : 198.51.100.39"
   "Health Monitors", "bigip"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/gtm2-click_add.png
      :align: left

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/gtm2_click-addserver.png
      :align: left

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/gtm1.site2_create.png
      :align: left

.. admonition:: TMSH

   tmsh create gtm server gtm1.site2_server datacenter site2_datacenter devices add { gtm1.site2.example.com { addresses add { 198.51.100.39 } } } monitor bigip product bigip
