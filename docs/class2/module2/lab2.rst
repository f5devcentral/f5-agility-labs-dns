DNS Profile
#####################################

A DNS profile will control which features are enabled as part of processing a query.

Navigate to: **DNS  ››  Delivery : Profiles : DNS**

.. image:: /_static/class2/router01_ltm_profile_dns.png

Create a DNS profile as shown in the table below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_profile"
   "DNS Cache", "Enabled"
   "DNS Cache Name", "transparent_cache"
   "Use BIND Server on Big-IP", "Disabled"
   "Logging", "Enabled"
   "Logging Profile", "example_dns_logging_profile"
   "AVR statistics Sample Rate", "Enabled, 1/1 queries sampled"

.. image:: /_static/class2/dns_profile_settings_cache_router01.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns/create.jsp

.. admonition:: TMSH

   tmsh create ltm profile dns example.com_dns_profile { avr-dnsstat-sample-rate 1 cache transparent_cache defaults-from dns enable-cache yes enable-logging yes log-profile example_dns_logging_profile use-local-bind no }
