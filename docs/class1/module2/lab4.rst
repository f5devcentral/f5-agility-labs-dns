TCP Profile
============================

A TCP profile is associated with a listener.

.. note:: **It is required to complete the following task on both dns.sitea and dns.siteb**

Navigate to: **DNS  ››  Delivery : Profiles : Protocol : TCP**

.. image:: /_static/class1/dns_profile_tcp_flyout.png
   :width: 800

Create a new TCP profile as shown in the following table.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "f5demo.com_tcp-dns_profile"
   "Parent Profile", "f5-tcp-wan"

.. image:: /_static/class1/dns_profile_tcp.png
   :width: 800

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/create.jsp

.. https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/create.jsp

TMSH Command for both dns.sitea and dns.siteb:

.. admonition:: TMSH

   tmsh create ltm profile tcp f5demo.com_tcp-dns_profile defaults-from tcp-wan-optimized
