############################################
TCP IP Address
############################################

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/listener/list.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/listener/list.jsp

.. note:: It is required to complete the following task on both gtm1.site and gtm1.site2

Create a TCP listener.

.. csv-table::
   :header: "Setting", "gtm1.site1", "gtm1.site2"
   :widths: 15, 15, 15

   "Name", "isp1_site1_ns1.example.com_tcp_53_virtual", "isp2_site2_ns2.example.com_tcp_53_virtual"
   "Destination", "203.0.113.8", "198.51.100.40"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile", "example.com_dns_profile"

.. image:: images/listener_flyout.png

.. image:: images/listener_tcp_settings.png

TMSH command for adding a listener:
::

   create /gtm listener <listener_name> address <listener_IP_address> ip-protocol udp

.. rubric:: References

.. [#f1] https://support.f5.com/csp/article/K14923
