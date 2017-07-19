Modify DNS Profile
###############################

In order to activate the new "Validating Resolver", modify the DNS profile example.com_dns_profile.

Navigate to: **DNS  ››  Delivery : Profiles : DNS**

.. image:: /_static/class2/modify_dns_profile_activate_validating_resolver.png

Select the profile "example.com_dns_profile"

Modify the DNS profile to activate the new validating-resolver_cache.

.. image:: /_static/class2/modify_dns_profile_validating_resolver.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/profile/dns/properties.jsp?name=/Common/example.com_dns_profile

.. admonition:: TMSH

   tmsh modify ltm profile dns example.com_dns_profile cache validating-resolver_cache
