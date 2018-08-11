DNS Profile
############################################

Configure a DNS profile to associate with the listener we have just created. The DNS profile is where we define how to handle the DNS traffic received by the listener, this includes DNS specific features such as DNSSEC, DNS Express and many others. For more informaton on DNS profiles, please refer to the link below.

|dns-profile_link|

.. |dns-profile_link| raw:: html

   <a href="https://support.f5.com/csp/article/K21520582" target="_blank">More information on DNS profiles</a>

.. note::  **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

|site1_create_dns-profile|

.. |site1_create_dns-profile| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/dns/create.jsp" target="_blank">DNS ›› Delivery : Profiles : DNS</a>

|site2_create_dns-profile|

.. |site2_create_dns-profile| raw:: html

   On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/dns/create.jsp" target="_blank">DNS ›› Delivery : Profiles : DNS</a>

.. image:: /_static/class1/dns_profile_flyout.png
   :align: left

Create a new DNS profile as shown in the following table.

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "example.com_dns_profile"
   "DNSSEC", "Disabled"
   "DNS Express", "Disabled"
   "Unhandled Query Action", "Drop"
   "Use BIND Server on Big-IP", "Disabled"
   "Logging", "Enabled"
   "Logging Profile", "example_dns_logging_profile"
   "AVR statistics Sample Rate", "Enabled, 1/1 queries sampled"

.. image:: /_static/class1/dns_profile_settings.png
   :align: left

TMSH command for both gtm1.site1 and gtm1.site2:

.. admonition:: TMSH

   tmsh create ltm profile dns example.com_dns_profile use-local-bind no unhandled-query-action drop log-profile example_dns_logging_profile enable-logging yes avr-dnsstat-sample-rate 1 enable-dns-express no enable-dnssec no

