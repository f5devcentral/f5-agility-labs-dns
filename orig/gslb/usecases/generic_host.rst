############################################
Generic Host
############################################

GTM can handle virtual servers that do not reside on a BigIP. The most
common way of incorporating non-F5 virtual server is using a Server type
of Generic Host.

-  In the GUI, navigate to: **DNS > GSLB > Servers > Server List: Create**

-  Create a Server Objects as defined in the table below. Note that the
       web virtual server is manually configured here and happens to be
       the same IP address as the physical host.

+-----------------------------------+--------------------------+
| **Name**                          | lamp1.site1              |
+===================================+==========================+
| **Product**                       | Generic Host             |
+-----------------------------------+--------------------------+
| **Address**                       | 203.0.113.15 (tap Add)   |
+-----------------------------------+--------------------------+
| **Data Center**                   | site1\_datacenter        |
+-----------------------------------+--------------------------+
| **Health Monitors**               | Gateway\_icmp            |
+-----------------------------------+--------------------------+
| **Virtual Server List Name**      | lamp1.site1              |
+-----------------------------------+--------------------------+
| **Virtual Server List Address**   | 203.0.113.15 (tap Add)   |
+-----------------------------------+--------------------------+
| **Service Port**                  | 80                       |
+-----------------------------------+--------------------------+
|                                   | Click Finished           |
+-----------------------------------+--------------------------+

+-----------------------------------+---------------------------+
| **Name**                          | lamp1.site2               |
+===================================+===========================+
| **Product**                       | Generic Host              |
+-----------------------------------+---------------------------+
| **Address**                       | 198.51.100.47 (tap Add)   |
+-----------------------------------+---------------------------+
| **Data Center**                   | site2\_datacenter         |
+-----------------------------------+---------------------------+
| **Health Monitors**               | Gateway\_icmp             |
+-----------------------------------+---------------------------+
| **Virtual Server List Name**      | lamp2.site1               |
+-----------------------------------+---------------------------+
| **Virtual Server List Address**   | 198.51.100.47 (tap Add)   |
+-----------------------------------+---------------------------+
| **Service Port**                  | 80                        |
+-----------------------------------+---------------------------+
|                                   | Click Finished            |
+-----------------------------------+---------------------------+

|image8|

|image9|

-  Make sure all server objects are available

   |image10|
