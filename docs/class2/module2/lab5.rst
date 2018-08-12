UDP Listener
################################

A UDP listener is an IP address that will receive DNS queries.

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

.. image:: /class2/media/router01_create_virtual_flyout.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/listener/list.jsp

Create two UDP listeners according to the tables below:

**Pro-tip: You can use the 'Repeat' button to easily create the second virtual server**

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC01_udp_53_virtual"
   "Destination Address", "10.1.20.200"
   "Service Port (Advanced Settings)", "DNS 53"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Protocol", "UDP"
   "Protocol Profile (Client)", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "Default Pool", "branch01_dns_pool"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC02_udp_53_virtual"
   "Destination Address", "10.1.20.210"
   "Service Port (Advanced Settings)", "DNS 53"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Protocol", "UDP"
   "Protocol Profile (Client)", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "Default Pool", "branch01_dns_pool"

.. image:: /class2/media/udp_listener.png
.. image:: /class2/media/udp_listener_profile.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/virtual_server/create.jsp

.. admonition:: TMSH

   tmsh create gtm listener DC01_udp_53_virtual address 10.1.20.200 port 53 ip-protocol udp pool branch01_dns_pool profiles add { example.com_dns_profile  example.com_udp-dns_profile } vlans add { branch01_vlan } vlans-enabled

.. admonition:: TMSH

   tmsh create gtm listener DC02_udp_53_virtual address 10.1.20.210 port 53 ip-protocol udp pool branch01_dns_pool profiles add { example.com_dns_profile  example.com_udp-dns_profile } vlans add { branch01_vlan } vlans-enabled

