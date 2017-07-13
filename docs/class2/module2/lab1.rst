Name Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to **DNS  ››  Delivery : Nameservers : Nameserver List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/nameserver/create.jsp

Click Create button

.. image:: /_static/class2/create_nameserver_flyout.png

Create a nameserver according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "dc01.example.com"
   "Address", "10.1.70.200"

.. image:: /_static/class2/create_nameserver_dc01.png

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns nameserver dc01.example.com { address 10.1.70.200 }
