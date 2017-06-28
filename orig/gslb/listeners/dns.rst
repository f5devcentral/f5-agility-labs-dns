############################################
DNS Profile
############################################

A DNS profile controls the way a listener processes a query.

Navigate to: **DNS > Delivery > Profiles > DNS: Create**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns/list.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns/list.jsp?

..  note::  It is required to complete the following task on both gtm1.site and gtm1.site2

Create a new DNS profile as shown in the following table.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_profile"
   "Unhandled Query Action", "Drop"
   "Use BIND Server on Big-IP", "Disabled"
   "Logging", "Enabled"
   "Logging Profile", "example_dns_logging_profile"
   "AVR statistics Sample Rate", "Enabled, 1/1 queries sampled"

.. figure:: ./images/dns_profile_flyout.png

.. figure:: ./images/dns_profile_settings.png

TMSH Command:

create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns

.. rubric:: References
.. [#f1] https://support.f5.com/csp/article/K14510
