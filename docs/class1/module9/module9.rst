LB Methods
###############################

Modify the GSLB configuration so that site2 is a standby DR site.

On gtm1.site1 navigate to: **DNS  ››  GSLB : Pools : Pool List  ››  Members : www.example.com_pool**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/pool/members.jsp?name=%2FCommon%2Fwww.example.com_pool&pool_type=1&identity=www.example.com_pool

.. image:: /_static/class1/gslb_pool_persistence_flyout.png

Modify the "Load Balancing Method" -> "Preferred" to "Global Availability"

.. image:: /_static/class1/

