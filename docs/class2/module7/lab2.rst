iRule assignment
############################

Repeat the following steps for all 4 DNS listeners.

Navigate to: **DNS  ››  Delivery : Listeners : Listener List**

.. image:: /class2/media/listener-assignment-1.png

Navigate to the listener DC01_udp_53_virtual 

.. image:: /class2/media/mod7lab2-listener.png

Navigate to iRules section

.. image:: /class2/media/mod7lab2-irule.png

Navigate to Manage

.. image:: /class2/media/irule-assignment-4-c.png

https://router01.branch01.example.com/tmui/Control/form?__handler=/tmui/dns/listener/irules&__source=Manage...&__linked=false&__fromError=false

Highlight DNS-query-filtering iRule and move it to Selected column

.. image:: /class2/media/irule-assignment-5-c.png

TMSH commands for router01.branch01 

.. admonition:: TMSH

   tmsh modify gtm listener all rules { DNS-query-filtering }
