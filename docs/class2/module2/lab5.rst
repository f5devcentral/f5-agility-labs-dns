UDP Virtual
################################

Navigate to: **Local Traffic  ››  Virtual Servers : Virtual Server List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/virtual_server/create.jsp

Create two UDP listeners according to the tables below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC01_udp_53_virtual"
   "Destination", "10.1.70.200:53"
   "Protocol", "UDP"
   "Protocol Profile (Client)", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Pool", "example.com_dns_pool"

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "DC02_udp_53_virtual"
   "Destination", "10.1.70.210:53"
   "Protocol", "UDP"
   "Protocol Profile (Client)", "example.com_udp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Pool", "example.com_dns_pool"

.. image:: /_static/class2/router01_create_virtual_flyout.png

.. image:: /_static/class2/router01_create_virtual_udp_properties.png

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm virtual branch01_udp_53_virtual destination 10.1.70.200:domain ip-protocol udp mask 255.255.255.255 profiles add { example.com_dns_profile { } example.com_udp-dns_profile { } } source 0.0.0.0/0 source-address-translation { type automap } translate-address disabled translate-port enabled vlans add { branch01_vlan } vlans-enabled pool example.com_dns_pool

   tmsh create ltm virtual branch01_udp_53_virtual destination 10.1.70.200:domain ip-protocol udp mask 255.255.255.255 profiles add { example.com_dns_profile { } example.com_udp-dns_profile { } } source 0.0.0.0/0 source-address-translation { type automap } translate-address disabled translate-port enabled vlans add { branch01_vlan } vlans-enabled pool example.com_dns_pool