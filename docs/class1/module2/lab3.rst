UDP Profile
============================

A UDP profile is associated with a listener.

.. note::  **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

Navigate to: **DNS  ››  Delivery : Profiles : Protocol : UDP**

.. image:: /_static/class1/udp-dns_profile_flyout.png

Create a new UDP profile as shown in the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_udp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. image:: /_static/class1/udp-dns_profile.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/udp/create.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/udp/create.jsp

TMSH command for both gtm1.site1 and gtm1.site2:

.. admonition:: TMSH

   tmsh create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns
