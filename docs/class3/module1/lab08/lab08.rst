Failure Condition
=====================

Having followed the excercises up to this point will have resulted in the creation of an active/active disaster recovery topology. An alternating response is received when querying www.example.com. From the command prompt in the Jumpbox type "dig www.example.com". Repeat dig commands and observe the TTL counting down.

   .. image:: ../../media/dc01_new_delegation_create_cname_results.png
      :align: left

Log into both the Active and the Standby ADC device in SITE1 and disable all interfaces.

https://bigip1.site1.example.com/tmui/Control/jspmap/tmui/locallb/network/interface/list.jsp

https://bigip2.site1.example.com/tmui/Control/jspmap/tmui/locallb/network/interface/list.jsp

   .. image:: ../../media/site1_bigip1_disabled-interface.png
      :align: left

TMSH command to run on bigip1.site1 and bigip2.site1 to simulate a network failure

   .. admonition:: TMSH

      tmsh modify interface all disabled

Log into gtm1.site1 and observe the status of "Server" objects:

   .. image:: ../../media/site1_adc_failure.png
      :align: left

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp

   .. admonition:: TMSH

      tmsh show gtm server

   .. image:: ../../media/dig_results_failure.png
      :align: left

Log into bigip1.site1 and bigip2.site1 and enable all interfaces

https://bigip1.site1.example.com/tmui/Control/jspmap/tmui/locallb/network/interface/list.jsp

https://bigip2.site1.example.com/tmui/Control/jspmap/tmui/locallb/network/interface/list.jsp

   .. admonition:: TMSH

      tmsh modify interface all enabled


