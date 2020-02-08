DNS Express
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have a nameserver defined, we must configure the DNSX zone. When complete the BIG-IP will begin requesting zone transfers for  *example.com from that name server. 

Navigate to **DNS  ››  Zones : Zones : Zone List**

.. image:: /class2/media/create_dnsxpress_flyout.png

Create a DNS Express zone according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com"
   "Server", "master.example.com"
   "Allow NOTIFY From", "10.1.20.4"
   "Verfiy Notify TSIG", "disable (uncheck box)"

.. image:: /class2/media/mod3lab2-newzone.png

.. admonition:: TMSH

   tmsh create ltm dns zone example.com { dns-express-allow-notify add { 10.1.20.20.40 } dns-express-notify-tsig-verify no dns-express-server master.example.com }


https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-services-implementations-13-1-0/1.html
