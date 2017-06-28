==================================
Settings
==================================

Configure the global settings for GSLB according to the following table:

Log into gtm1.site1 and complete the following task in the UI or cli

Navigate to: **DNS  ››  Settings : GSLB : General**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/settings/gslb/properties_general.jsp

.. csv-table::
   :header: "Setting", "Value", "Description"
   :widths: 15, 15, 30

   "Synchronize", "checked", "Not on by default"
   "Group Name", "EXAMPLE_group", "Org specific"
   "Synchronize DNS Zone Files", "checked", "BIND zone file updates"

.. figure:: ./images/gtm_global_settings.png

TMSH command
 modify gtm global-settings general synchronization yes synchronization-group-name EXAMPLE_group synchronize-zone-files yes


.. rubric:: References
.. [#f1] https://support.f5.com/csp/article/K13734
.. [#f2] https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-implementations-12-0-0/4.html
