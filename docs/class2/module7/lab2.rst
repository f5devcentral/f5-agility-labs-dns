iRule assignment
############################

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

.. image:: /_static/class2/listener-assignment-1.png

Navigate to the listener branch01_udp_53_virtual  

.. image:: /_static/class2/listener-assignment-2.png

Navigate to iRules section

.. image:: /_static/class2/irule-assignment-3.png

Navigate to Manage

.. image:: /_static/class2/irule-assignment-4.png

https://router01.branch01.example.com/tmui/Control/form?__handler=/tmui/dns/listener/irules&__source=Manage...&__linked=false&__fromError=false

Highlight DNS-query-filtering iRule and move it to Selected column

.. image:: /_static/class2/irule-assignment-5.png

TMSH commands for router01.branch01 

.. admonition:: TMSH

   tmsh modify ltm virtual branch01_udp_53_virtual rules { DNS-query-filtering }
