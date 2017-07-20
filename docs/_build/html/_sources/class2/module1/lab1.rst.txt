Health Monitor
####################################

Before we create a pool of DNS servers we need to define our health monitor.

Navigate to: **Delivery : Load Balancing : Monitors**

.. image:: /_static/class2/class2_create_health-monitor_flyout.png

Create a pool according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_monitor"
   "Type", "DNS"
   "Query Name", "www.example.com"

.. image:: /_static/class2/class2_dns_monitor_create_properties.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/monitor/create.jsp

.. admonition:: TMSH
 
   tmsh create ltm monitor dns example.com_dns_monitor defaults-from dns qname www.example.com

