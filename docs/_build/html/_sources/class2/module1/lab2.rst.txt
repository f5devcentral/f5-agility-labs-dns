Load Balancing
####################################

Augment and scale an existing DNS infrastructure by Load Balancing DNS queries across a pool of DNS servers.

Navigate to: **Delivery : Load Balancing : Pools : Pool List**

.. image:: /_static/class2/class2_dns__pool_create_flyout.png

Create a pool according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "branch01_dns_pool"
   "Health Monitors", "example.com_dns_monitor"
   "1. Node Name", "dc01.branch01.example.com_node"
   "1. Address", "10.1.70.200"
   "1. Service Port", "53"
   "2. Node Name", "dc02.branch01.example.com_node"
   "2. Address", "10.1.70.210"
   "2. Service Port", "53"

.. image:: /_static/class2/class2_create_dns_pool_properties.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/pool/create.jsp

.. admonition:: TMSH

   tmsh create ltm pool branch01_dns_pool members add { dc01.branch01.example.com_node:53 { address 10.1.70.200 }  dc02.branch01.example.com_node:53 { address 10.1.70.210 } } monitor example.com_dns_monitor
