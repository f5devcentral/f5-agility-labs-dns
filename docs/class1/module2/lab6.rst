TCP IP Address
############################################

A TCP listener will receive and process DNS queries.

.. note:: **It is required to complete the following task on both gtm1.site and gtm1.site2**

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

.. image:: /_static/class1/listener_flyout.png

Create a TCP listener.

.. csv-table::
   :header: "Setting", "gtm1.site1", "gtm1.site2"
   :widths: 6, 10, 10

   "Name", "isp1_site1_ns1.example.com_tcp_53_virtual", "isp1_site2_ns2.example.com_tcp_53_virtual"
   "Destination", "203.0.113.8", "198.51.100.40"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile", "example.com_dns_profile"

.. image:: /_static/class1/listener_tcp_settings.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp

gtm1.site1 TMSH command:

.. admonition:: TMSH

    tmsh create gtm listener isp1_site1_ns1.example.com_tcp_53_virtual address 203.0.113.8 ip-protocol tcp mask 255.255.255.255 port 53 profiles add { example.com_dns_profile example.com_tcp-dns_profile }

gtm1.site2 TMSH command:

.. admonition:: TMSH

   tmsh create gtm listener isp1_site2_ns2.example.com_tcp_53_virtual address 198.51.100.40 ip-protocol tcp mask 255.255.255.255 port 53 profiles add { example.com_dns_profile example.com_tcp-dns_profile }

https://support.f5.com/csp/article/K14923
