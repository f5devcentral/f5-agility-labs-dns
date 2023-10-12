UDP IP Address
############################################

A UDP listener will receive and process DNS queries.

.. note:: **It is required to complete the following task on both dns.sitea and dns.siteb**

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

.. image:: /_static/class1/listener_flyout.png
   :width: 800

Create a UDP listener according to the following table:

.. csv-table::
   :header: "Setting", "dns.sitea", "dns.siteb"
   :widths: 6, 10, 10

   "Name", "dns_sitea_ns1.f5demo.com_udp_53_virtual", "dns_siteb_ns2.f5demo.com_udp_53_virtual"
   "Destination", "10.1.10.101", "10.1.60.101"
   "Protocol Profile (Client)", "f5demo.com_udp-dns_profile", "f5demo.com_udp-dns_profile"
   "DNS Profile", "f5demo.com_dns_profile", "f5demo.com_dns_profile"

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp

.. https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp

.. image:: /_static/class1/listener_settings.png
   :width: 800

dns.sitea TMSH command:

.. admonition:: TMSH

   tmsh create gtm listener dns_sitea_ns1.f5demo.com_udp_53_virtual address 10.1.10.101 ip-protocol udp mask 255.255.255.255 port 53 profiles add { f5demo.com_dns_profile f5demo.com_udp-dns_profile }

dns.siteb TMSH command:

.. admonition:: TMSH

   tmsh create gtm listener dns_siteb_ns2.f5demo.com_udp_53_virtual address 10.1.60.101 ip-protocol udp mask 255.255.255.255 port 53 profiles add { f5demo.com_dns_profile f5demo.com_udp-dns_profile }

https://support.f5.com/csp/article/K14923
