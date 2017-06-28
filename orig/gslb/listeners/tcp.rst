============================
TCP Profile
============================

A TCP profile is associated with a listener.

Navigate to: **DNS  ››  Delivery : Profiles : Protocol : TCP**

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/list.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/list.jsp

.. note:: It is required to complete the following task on both gtm1.site and gtm1.site2

Create a new TCP profile as shown in the following table.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_tcp-dns_profile"
   "Parent Profile", "tcp-wan-optimized"

.. figure:: ./images/dns_profile_tcp.png

TMSH Command for both gtm1.site and gtm1.site2:

create ltm profile tcp example.com_tcp-dns_profile defaults-from tcp-wan-optimized

.. rubric:: References
.. [#f1] Share cool links here
