DNS Profile
#####################################

Navigate to: **Local Traffic  ››  Profiles : Services : DNS**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/dns/properties.jsp?name=/Common/example.com_dns_profile

Modify the example.com_dns_profile DNS profile as shown in the table below.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "DNS Express", "unchecked"

.. image:: /_static/class2/router01_ltm_profile_dns.png

.. image:: /_static/class2/modify_dns_profile_enable_dnsx.png

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh  modify ltm profile dns example.com_dns_profile enable-dns-express default-value

