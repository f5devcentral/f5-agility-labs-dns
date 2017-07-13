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

   "Name", "localhost"

.. image:: /_static/class2/create_nameserver_localhost.png

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns nameserver localhost { address 127.0.0.1 }
