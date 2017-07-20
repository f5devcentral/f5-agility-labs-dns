Logging
############################################

Configure DNS query and response logging. Create a "Log Publisher", and a "Logging Profile"

.. note::  **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

#. Navigate to: **System  ››  Logs : Configuration : Log Publishers**

   .. image:: /_static/class1/system_log_publisher_flyout.png

   Create a local syslog publisher according to the table below:

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "local-syslog-publisher"
      "Destinations", "local-syslog"

   .. image:: /_static/class1/sys_syslog_publisher_details.png

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   On both gtm1.site1 and gtm1.site run the following command:
   
   .. admonition:: TMSH

      tmsh create sys log-config publisher local-syslog-publisher { destinations { local-syslog { } } }

#. Navigate to: **DNS > Delivery > Profiles > Other > DNS Logging: Create**

   .. image:: /_static/class1/dns_logging_profile_flyout.png

   Create a new DNS logging profile as shown in the table below.

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "example_dns_logging_profile"
      "Log Publisher", "local-syslog-publisher"
      "Log Responses", "enabled"
      "Include Query ID", "enabled"

   .. image:: /_static/class1/dns_logging_profile_create.png

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp

   https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp

   **TMSH command for both gtm1.site1 and gtm1.site2:**

   .. admonition:: TMSH

      tmsh create ltm profile dns-logging example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-syslog-publisher

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-external-monitoring-implementations-12-0-0/5.html
