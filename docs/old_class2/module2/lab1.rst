Log Profile
##################################################

Configure DNS query and response logging.

#. Create a "Log Publisher" for local syslog.

   Navigate to: **System  ››  Logs : Configuration : Log Publishers**

   .. image:: /_static/class1/system_log_publisher_flyout.png

   Create a local syslog publisher as shown in the table below:

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "local-syslog-publisher"
      "Destinations", "local-syslog"

   .. image:: /_static/class1/sys_syslog_publisher_details.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   .. admonition:: TMSH

      tmsh create sys log-config publisher local-syslog-publisher { destinations add { local-syslog { } } }

#. Create a "Logging Profile"

   Navigate to **DNS  ››  Delivery : Profiles : Other : DNS Logging**

   .. image:: /_static/class2/dns_cache_transparent_flyout_router01.png

   Create a DNS logging profile as shown in the table below:

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "example_dns_logging_profile"
      "Log Publisher", "local-syslog-publisher"
      "Log Responses", "enabled"
      "Include Query ID", "enabled"

   .. image:: /_static/class2/dns_cache_transparent_create_router01.png

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns_log/create.jsp

   .. admonition:: TMSH

      tmsh create ltm profile dns-logging example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-syslog-publisher
