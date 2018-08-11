Name Server
##############################

Navigate to **DNS  ››  Delivery : Nameservers : Nameserver List**

.. image:: /_static/class2/create_nameserver_flyout.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/nameserver/list.jsp

Create a nameserver according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "localhost"

.. image:: /_static/class2/create_nameserver_localhost.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/nameserver/create.jsp

.. admonition:: TMSH

   tmsh create ltm dns nameserver localhost { address 127.0.0.1 tsig-key none }
