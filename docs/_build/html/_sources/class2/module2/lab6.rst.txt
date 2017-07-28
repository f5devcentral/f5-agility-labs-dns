TCP Listeners
####################################

A TCP listener is an IP address that will receive DNS queries.

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

.. image:: /_static/class2/router01_create_virtual_flyout.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/listener/list.jsp

Create two TCP listeners according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC01_tcp_53_virtual"
   "Destination", "10.1.70.200"
   "Service Port", "DNS 53"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Protocol", "TCP"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "Pool", "branch01_dns_pool"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC02_tcp_53_virtual"
   "Destination", "10.1.70.210"
   "Service Port", "DNS 53"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Protocol", "TCP"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "Pool", "branch01_dns_pool"

.. image:: /_static/class2/router01_create_virtual_tcp_properties.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/listener/create.jsp

.. admonition:: TMSH

   tmsh create gtm listener DC01_tcp_virtual address 10.1.70.200 port 53 ip-protocol tcp pool branch01_dns_pool profiles add { example.com_dns_profile  example.com_tcp-dns_profile } vlans add { branch01_vlan } vlans-enabled

.. admonition:: TMSH

   tmsh create gtm listener DC02_tcp_virtual address 10.1.70.210 port 53 ip-protocol tcp pool branch01_dns_pool profiles add { example.com_dns_profile  example.com_tcp-dns_profile } vlans add { branch01_vlan } vlans-enabled

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-cache-implementations-11-3-0/2.html
