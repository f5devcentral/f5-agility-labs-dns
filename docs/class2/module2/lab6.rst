TCP Virtuals
####################################

Navigate to: **Local Traffic  ››  Virtual Servers : Virtual Server List**

.. image:: /_static/class2/router01_create_virtual_flyout.png

Create two TCP listeners according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC01_tcp_53_virtual"
   "Destination", "10.1.70.200:53"
   "Protocol", "TCP"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Address Translation", "unchecked"
   "Pool", "branch01_dns_pool"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC02_tcp_53_virtual"
   "Destination", "10.1.70.210:53"
   "Protocol", "TCP"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Address Translation", "unchecked"
   "Pool", "branch01_dns_pool"

.. image:: /_static/class2/router01_create_virtual_tcp_properties.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp

.. admonition:: TMSH

   tmsh create gtm listener DC01_udp_virtual address 10.1.70.200 port 53 ip-protocol tcp pool branch01_dns_pool profiles add { example.com_dns_profile  example.com_tcp-dns_profile } vlans add { branch01_vlan } vlans-enabled pool branch01_dns_pool

.. admonition:: TMSH

   tmsh create gtm listener DC02_udp_virtual address 10.1.70.210 port 53 ip-protocol tcp pool branch01_dns_pool profiles add { example.com_dns_profile  example.com_tcp-dns_profile } vlans add { branch01_vlan } vlans-enabled pool branch01_dns_pool

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-cache-implementations-11-3-0/2.html
