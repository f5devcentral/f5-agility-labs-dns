DNS Express
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The zone example.com is served from the high performance authoritative resolver.

Navigate to **DNS  ››  Zones : Zones : Zone List**

.. image:: /class2/media/create_dnsxpress_flyout.png

Create a DNS Express zone according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com"
   "Server", "dc01.example.com"
   "Allow NOTIFY From", "10.1.20.200"
   "Verfiy Notify TSIG", "disable (uncheck box)"

.. image:: /class2/media/mod3lab2-newzone.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/zone/create.jsp

.. admonition:: TMSH

   tmsh create ltm dns zone example.com { dns-express-allow-notify add { 10.1.20.200 } dns-express-notify-tsig-verify no dns-express-server dc01.example.com }


https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-services-implementations-13-1-0/1.html
