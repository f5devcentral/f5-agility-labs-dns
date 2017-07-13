DNS Express
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to **DNS  ››  Zones : Zones : Zone List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/zone/create.jsp

Click Create button

.. image:: /_static/class2/create_dnsxpress_flyout.png

Create a DNS Express zone according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com"
   "Server", "dc01.example.com"
   "Allow NOTIFY From", "10.1.70.200"

.. image:: /_static/class2/create_dnsxpress_zone_example.png

.. admonition:: TMSH

   tmsh create ltm dns zone example.com { dns-express-allow-notify { 10.1.70.200 } dns-express-notify-tsig-verify no dns-express-server dc01.example.com }
