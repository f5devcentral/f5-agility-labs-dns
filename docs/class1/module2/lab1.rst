Log Profile
############################################

Conimage DNS query and response logging.

#. On both gtm1.site1 and gtm1.site2 create a "Log Publisher" for local syslog. Navigate to: **System  ››  Logs : Configuration : Log Publishers**

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   .. image:: /_static/class1/system_log_publisher_flyout.png

   Create a local syslog publisher

   .. image:: /_static/class1/sys_syslog_publisher_details.png

   On both gtm1.site1 and gtm1.site run the following command:
   
   .. admonition:: TMSH

      tmsh create sys log-config publisher local-syslog-publisher { destinations { local-syslog { } } }

#. On both gtm1.site1 and gtm1.site2 create a "Log Profile": **DNS > Delivery > Profiles > Other > DNS Logging: Create**

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp

   https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp

   Create a new DNS logging profile as shown in the table below.

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "example_dns_logging_profile"
      "Log Publisher", "local-syslog-publisher"
      "Log Responses", "enabled"
      "Include Query ID", "enabled"

.. image:: /_static/class1/dns_logging_profile_flyout.png

.. image:: /_static/class1/dns_logging_profile_create.png

**TMSH command for both gtm1.site1 and gtm1.site2:**

.. admonition:: TMSH

   tmsh create ltm profile dns-logging example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-syslog-publisher

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-external-monitoring-implementations-12-0-0/5.html
