System
############################################

A BIG-IP System needs to be prepared before creating a GSLB configuration. Administrative tasks including SNMP/DNS/NTP settings have already been completed. The task of creating a "Logging Profile" is the beginning of this class. Create a log publisher and a DNS logging profile and then associate the two objects. The DNS logging profile will then be associated to a DNS listener in a later task. For more informaton on DNS logging, please refer to the link below.

|location_link|

.. |location_link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-external-monitoring-implementations-13-1-0/4.html" target="_blank">More information on DNS Logging</a>

#. Create a "Log Publisher"

   .. note::  **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

   |site1_create_publisher|

   .. |site1_create_publisher| raw:: html

      On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp" target="_blank">System  ››  Logs : Configuration : Log Publishers</a>

   |site2_create_publisher|

   .. |site2_create_publisher| raw:: html

      On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/system/log/create_publisher.jsp" target="_blank">System  ››  Logs : Configuration : Log Publishers</a>

   .. image:: ../../media/system_log_publisher_flyout.png
      :align: left

   Create a local syslog publisher according to the table below:

   .. csv-table::
      :header: "Field", "Value"
      :widths: 15, 15

      "Name", "local-syslog-publisher"
      "Destinations", "local-syslog"

   .. image:: ../../media/sys_syslog_publisher_details.png
      :align: left

   **TMSH command for both gtm1.site1 and gtm1.site2:**
   
   .. admonition:: TMSH

      tmsh create sys log-config publisher local-syslog-publisher { destinations replace-all-with { local-syslog { } } }

   |local-syslog-publisher_restui_link|

   .. |local-syslog-publisher_restui_link| raw:: html

      <a href="https://gtm1.site1.example.com/restui/default/default.html?$display=/mgmt/tm/sys/log-config/publisher/~Common~local-syslog-publisher#/" target="_blank">RestUI</a>

#. Create a "Logging Profile"

   .. note::  **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

   |site1_create_profile|

   .. |site1_create_profile| raw:: html

      On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp" target="_blank">DNS >> Delivery : Profiles : Other : DNS Logging</a>

   |site2_create_profile|

   .. |site2_create_profile| raw:: html

      On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns_log/create.jsp" target="_blank">DNS >> Delivery : Profiles : Other : DNS Logging</a>

   .. image:: ../../media/dns_logging_profile_flyout.png
      :align: left

   Create a new DNS logging profile as shown in the table below.

   .. csv-table::
      :header: "Field", "Value"
      :widths: 15, 15

      "Name", "example_dns_logging_profile"
      "Log Publisher", "local-syslog-publisher"
      "Log Responses", "enabled"
      "Include Query ID", "enabled"

   .. image:: ../../media/dns_logging_profile_create.png
      :align: left

   **TMSH command for both gtm1.site1 and gtm1.site2:**

   .. admonition:: TMSH

      tmsh create ltm profile dns-logging example_dns_logging_profile enable-response-logging yes include-query-id yes log-publisher local-syslog-publisher

   |local-syslog-profile_restui_link|

   .. |local-syslog-profile_restui_link| raw:: html

      <a href="https://gtm1.site1.example.com/restui/default/default.html?$display=/mgmt/tm/ltm/profile/dns-logging/~Common~example_dns_logging_profile#/" target="_blank">RestUI</a>

