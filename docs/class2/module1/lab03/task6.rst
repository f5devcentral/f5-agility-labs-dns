TCP IP Address
############################################

The IP address we configured in the previous task is not sufficient on its own in most cases. We need to also configure an IP address that is associated with a TCP profile to ensure that the BIG-IP DNS can process incoming TCP requests in addition to UDP.

.. note:: **It is required to complete the following task on both gtm1.site and gtm1.site2**

|site1_create_listener_link|

.. |site1_create_listener_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp" target="_blank">DNS  ››  Delivery : Listeners : Listener List</a>

|site2_create_listener_link|

.. |site2_create_listener_link| raw:: html

   On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp" target="_blank">DNS  ››  Delivery : Listeners : Listener List</a>

.. image:: /_static/class1/listener_flyout.png
   :align: left

Create a TCP listener.

.. csv-table::
   :header: "Field", "gtm1.site1", "gtm1.site2"
   :widths: 6, 10, 10

   "Name", "isp1_site1_ns1.example.com_tcp_53_virtual", "isp1_site2_ns2.example.com_tcp_53_virtual"
   "Destination", "203.0.113.8", "198.51.100.40"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile", "example.com_dns_profile"

.. image:: /_static/class1/listener_site1_tcp_settings.png
   :align: left

Be sure to create the 198.51.100.40 address on gtm1.site2

.. image:: /_static/class1/listener_site2_tcp_settings.png
   :align: left

gtm1.site1 TMSH command:

.. admonition:: TMSH

    tmsh create gtm listener isp1_site1_ns1.example.com_tcp_53_virtual address 203.0.113.8 ip-protocol tcp mask 255.255.255.255 port 53 profiles add { example.com_dns_profile example.com_tcp-dns_profile }

gtm1.site2 TMSH command:

.. admonition:: TMSH

   tmsh create gtm listener isp1_site2_ns2.example.com_tcp_53_virtual address 198.51.100.40 ip-protocol tcp mask 255.255.255.255 port 53 profiles add { example.com_dns_profile example.com_tcp-dns_profile }