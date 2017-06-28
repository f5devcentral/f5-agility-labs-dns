Log Profile
############################################

Configure DNS query and response logging.

Navigate to **DNS > Delivery > Profiles > Other > DNS Logging: Create**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/list.jsp

https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/list.jsp

.. note::  It is required to complete the following task on both gtm1.site and gtm1.site2

Create a new DNS logging profile as shown in the table below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example_dns_logging_profile"
   "Log Publisher", "sys-db-access-publisher"
   "Log Responses", "enabled"
   "Include Query ID", "enabled"

.. figure:: /_static/class1/dns_logging_profile_flyout.png
   :width: 800

.. figure:: /_static/class1/dns_logging_profile_create.png
   :width: 800

TMSH command for both gtm1.site1 and gtm1.site2:

.. admonition:: TMSH

   tmsh create ltm profile dns-logging example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-db-publisher

.. rubric:: References
.. [#f1] https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-external-monitoring-implementations-12-0-0/5.html
