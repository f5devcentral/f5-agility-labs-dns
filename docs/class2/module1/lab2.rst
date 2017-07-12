DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Profiles : Services : DNS**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns/list.jsp

Create a DNS profile as shown in the table below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_profile"
   "DNS Cache", "Enabled"
   "DNS Cache Name", "resolver_cache"
   "Unhandled Query Action", "Drop"
   "Use BIND Server on Big-IP", "Disabled"
   "Logging", "Enabled"
   "Logging Profile", "example_dns_logging_profile"
   "AVR statistics Sample Rate", "Enabled, 1/1 queries sampled"

.. image:: /_static/class2/router01_ltm_profile_dns.png
   :width: 800

.. image:: /_static/class2/dns_profile_settings_router01.png
   :width: 800

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm profile dns example.com_dns_profile use-local-bind no unhandled-query-action drop log-profile example_dns_logging_profile enable-logging yes avr-dnsstat-sample-rate 1 enable-cache yes cache resolver_cache

