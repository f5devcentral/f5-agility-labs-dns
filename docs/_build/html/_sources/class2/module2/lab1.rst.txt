Log Profile
##################################################

Configure DNS query and response logging.

#. Create a "Log Publisher" for local syslog.

   Navigate to: **System  ››  Logs : Configuration : Log Publishers**

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp

   .. image:: /_static/class1/system_log_publisher_flyout.png

   Create a local syslog publisher

   .. image:: /_static/class1/sys_syslog_publisher_details.png

   .. admonition:: TMSH

      tmsh create sys log-config publisher local-syslog-publisher { destinations add { local-syslog { } } }

#. Create a Logging Profile"

   Navigate to **Local Traffic  ››  Profiles : Other : DNS Logging**

   https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns_log/create.jsp

   Create a DNS logging profile as shown in the table below.

   .. csv-table::
      :header: "Setting", "Value"
      :widths: 15, 15

      "Name", "example_dns_logging_profile"
      "Log Publisher", "local-syslog-publisher"
      "Log Responses", "enabled"
      "Include Query ID", "enabled"

   .. image:: /_static/class2/dns_cache_transparent_flyout_router01.png

   .. image:: /_static/class2/dns_cache_transparent_create_router01.png

   TMSH command for router01.branch01:

   .. admonition:: TMSH

      tmsh create ltm profile dns-logging example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-syslog-publisher
