DNS Servers
################################

Create a monitor and a pool for the Internal DNS servers.

Navigate to: **DNS  ››  Delivery : Load Balancing : Monitors**

.. image:: /_static/class2/router01_create_monitor_flyout.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/monitor/create.jsp

Create a DNS monitor according to the table below:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_monitor"
   "Type", "DNS"
   "Query Name", "www.example.com"

.. image:: /_static/class2/router01_create_monitor_properties.png
.. admonition:: TMSH

   tmsh create ltm monitor dns example.com_dns_monitors qname www.example.com

Navigate to: **DNS  ››  Delivery : Load Balancing : Pools : Pool List**

.. image:: /_static/class2/router01_create_dns_pool_flyout.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/pool/list.jsp

Create a DNS pool according to the table below:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_pool"
   "Health Monitors", "example.com_dns_monitor"
   "Node1 Name:", "dc01.example.com_node"
   "Node1 Address:", "10.1.70.200"
   "Node1 Port:", "53"
   "Node2 Name:", "dc02.example.com_node"
   "Node2 Address:", "10.1.70.210"
   "Node2 Port:", "53"

.. image:: /_static/class2/router01_create_dns_pool_properties.png

.. admonition:: TMSH

   tmsh create ltm pool example.com_dns_pool members add { dc01.example.com_node:53 { address 10.1.70.200 } dc02.example.com_node:53 { address 10.1.70.210 } } monitor example.com_dns_monitor


