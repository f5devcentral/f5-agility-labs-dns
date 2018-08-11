DNS Express
==============================

Navigate to **DNS  ››  Zones : Zones : Zone List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/zone/create.jsp

.. image:: /_static/class2/create_dnsxpress_flyout.png

Create a DNS Express zone according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "rpz.example.com"
   "Server", "localhost"
   "Allow NOTIFY From", "127.0.0.1"
   "Response Policy", "checked"

.. image:: /_static/class2/create_dnsxpress_zone.png

.. admonition:: TMSH

   tmsh create ltm dns zone rpz.example.com { dns-express-server localhost response-policy yes dns-express-allow-notify add { 127.0.0.1  } dns-express-notify-tsig-verify no }
