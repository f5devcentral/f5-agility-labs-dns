UDP Profile
============================

A UDP profile is associated with a listener.

Navigate to: **DNS  ››  Delivery : Profiles : Protocol : UDP**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/udp/list.jsp?

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/udp/list.jsp?

..  note:: It is required to complete the following task on both gtm1.site and gtm1.site2

Create a new UDP profile as shown in the following table. Retain the defaults if the setting is not noted in the table.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_udp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. figure:: /_static/class1/udp-dns_profile.png
   :width: 800

TMSH command for both gtm1.site1 and gtm1.site2:

.. code-block:: cli

   tmsh create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns

.. rubric:: References
.. [#f1] Share cool links here
