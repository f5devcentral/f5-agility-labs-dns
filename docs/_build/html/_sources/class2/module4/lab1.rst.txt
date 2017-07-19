Name Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Define the Active Directory server as a nameserver and initiate a zone transfer.

Navigate to **DNS  ››  Delivery : Nameservers : Nameserver List**

.. image:: /_static/class2/create_nameserver_flyout.png

Create a nameserver according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "dc01.example.com"
   "Address", "10.1.70.200"

.. image:: /_static/class2/create_nameserver_dc01.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/nameserver/create.jsp

.. admonition:: TMSH

   tmsh create ltm dns nameserver dc01.example.com { address 10.1.70.200 }
