UDP IP Address
############################################

We will now begin to put the pieces together. In this task, we will integrate the logging, DNS and UDP profiles we created earlier with an IP address. The IP address configured on the BIG-IP DNS will listen for queries and process them in accordance with the associated profiles. 

.. note:: **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

|site1_create_listener_link|

.. |site1_create_listener_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp" target="_blank">DNS  ››  Delivery : Listeners : Listener List</a>

|site2_create_listener_link|

.. |site2_create_listener_link| raw:: html

   On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp" target="_blank">DNS  ››  Delivery : Listeners : Listener List</a>

.. image:: /_static/class1/listener_flyout.png
   :align: left

Create a UDP listener according to the following table:

.. csv-table::
   :header: "Field", "gtm1.site1", "gtm1.site2"
   :widths: 6, 10, 10

   "Name", "isp1_site1_ns1.example.com_udp_53_virtual", "isp1_site2_ns2.example.com_udp_53_virtual"
   "Destination", "203.0.113.8", "198.51.100.40"
   "Protocol Profile (Client)", "example.com_udp-dns_profile", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile", "example.com_dns_profile"

.. image:: /_static/class1/listener_site1-udp_settings.png
   :align: left

Make sure you create the IP addresses on the correct devices.

.. image:: /_static/class1/listener_site2-udp_settings.png
   :align: left

gtm1.site1 TMSH command:

.. admonition:: TMSH

   tmsh create gtm listener isp1_site1_ns1.example.com_udp_53_virtual address 203.0.113.8 ip-protocol udp mask 255.255.255.255 port 53 profiles add { example.com_dns_profile example.com_udp-dns_profile }

gtm1.site2 TMSH command:

.. admonition:: TMSH

   tmsh create gtm listener isp1_site2_ns2.example.com_udp_53_virtual address 198.51.100.40 ip-protocol udp mask 255.255.255.255 port 53 profiles add { example.com_dns_profile example.com_udp-dns_profile }

https://support.f5.com/csp/article/K14923
