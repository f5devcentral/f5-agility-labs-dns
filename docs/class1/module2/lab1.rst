Logging
############################################

Configure DNS query and response logging. Create a "Log Publisher", and a "Logging Profile"

.. note::  **It is required to complete the following task on both dns.sitea and dns.siteb**

#. Navigate to: **System  ››  Logs : Configuration : Log Publishers**

   .. image:: /_static/class1/system_log_publisher_flyout.png
      :width: 800

   Create a local syslog publisher according to the table below:

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "local-syslog-publisher"
      "Destinations", "local-syslog"

   .. image:: /_static/class1/sys_syslog_publisher_details.png
      :width: 800
    
   .. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   .. https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   On both dns.sitea and dns.siteb run the following command:
   
   .. admonition:: TMSH

      tmsh create sys log-config publisher local-syslog-publisher { destinations add { local-syslog { } } }

#. Navigate to: **DNS > Delivery > Profiles > Other > DNS Logging: Create**

   .. image:: /_static/class1/dns_logging_profile_flyout.png
      :width: 800

   Create a new DNS logging profile as shown in the table below.

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "f5demo_dns_logging_profile"
      "Log Publisher", "local-syslog-publisher"
      "Log Responses", "enabled"
      "Include Query ID", "enabled"
      
   .. image:: /_static/class1/dns_logging_profile_create.png
      :width: 800

   .. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp

   .. https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp

   **TMSH command for both dns.sitea and dns.siteb:**

   .. admonition:: TMSH

      tmsh create ltm profile dns-logging f5demo_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-syslog-publisher

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-external-monitoring-implementations-12-0-0/5.html
