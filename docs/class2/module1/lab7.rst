TCP Virtual
####################################

Navigate to: **Local Traffic  ››  Virtual Servers : Virtual Server List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/virtual_server/list.jsp?Filter=*

Create a TCP listener.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "branch01_tcp_53_virtual"
   "Destination", "10.1.70.200:53"
   "Protocol", "TCP"
   "Protocol Profile (Client)", "example.com_tcp-dns_profile"
   "DNS Profile", "example.com_dns_profile"
   "VLAN and Tunnel Traffic -> Enabled on..", "branch01_vlan"
   "Address Translation", "unchecked"

.. image:: /_static/class2/router01_create_virtual_flyout.png

.. image:: /_static/class2/router01_create_virtual_tcp_properties.png

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm virtual branch01_tcp_53_virtual destination 10.1.70.200:domain ip-protocol tcp mask 255.255.255.255 profiles add { example.com_dns_profile { } example.com_tcp-dns_profile { } } translate-address disabled vlans add { branch01_vlan } vlans-enabled


https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-cache-implementations-11-3-0/2.html
