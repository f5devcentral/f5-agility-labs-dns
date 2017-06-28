############################################
UDP IP Address
############################################

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/listener/list.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/listener/list.jsp

.. note:: It is required to complete the following task on both gtm1.site1 and gtm1.site2

Create a UDP listener.

.. csv-table::
   :header: "Setting", "gtm1.site1", "gtm1.site2"
   :widths: 15, 15, 15

   "Name", "isp1_site1_ns1.example.com_udp_53_virtual", "isp2_site2_ns2.example.com_udp_53_virtual"
   "Destination", "203.0.113.8", "198.51.100.40"
   "Protocol Profile (Client)", "example.com_udp-dns_profile", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile", "example.com_dns_profile"

.. image:: images/listener_flyout.png

.. image:: images/listener_settings.png

gtm1.site1 TMSH command:

create gtm listener isp1_site1_ns1.example.com_udp_53_virtual address 203.0.113.8 ip-protocol udp mask 255.255.255.255 port 53 profiles add {  example.com_dns_profile example.com_udp-dns_profile }

gtm1.site2 TMSH command:

create gtm listener isp2_site2_ns2.example.com_udp_53_virtual address 198.51.100.40 ip-protocol udp mask 255.255.255.255 port 53 profiles add {  example.com_dns_profile example.com_udp-dns_profile }

.. rubric:: References

.. [#f1] https://support.f5.com/csp/article/K14923
