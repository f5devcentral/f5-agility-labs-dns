UDP Profile
============================

Next, we are going to define a UDP profile. A UDP profile will instruct the BIG-IP DNS listener on how to handle UDP traffic. The DNS profile we created earlier instructs the BIG-IP DNS on how to process the layer 7 data inside of the UDP packets, but not how to handle the UDP protocol itself. For more information on UDP profiles, please refer to the link below. 

|udp-profile_link|

.. |udp-profile_link| raw:: html

   <a href="https://support.f5.com/csp/article/K7535" target="_blank">More information on UDP profiles</a>

.. note::  **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

|site1-udp-profile_link|

.. |site1-udp-profile_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/udp/create.jsp" target="_blank">DNS  ››  Delivery : Profiles : Protocol : UDP</a>

|site2-udp-profile_link|

.. |site2-udp-profile_link| raw:: html

   On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/udp/create.jsp" target="_blank">DNS  ››  Delivery : Profiles : Protocol : UDP</a>

.. image:: ../../media/udp-dns_profile_flyout.png
   :align: left

Create a new UDP profile as shown in the following table:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "example.com_udp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. image:: ../../media/udp-dns_profile.png
   :align: left

TMSH command for both gtm1.site1 and gtm1.site2:

.. admonition:: TMSH

   tmsh create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns
