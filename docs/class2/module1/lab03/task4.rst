TCP Profile
============================

Similarily, we will need to define a TCP profile. A TCP profile will instruct the BIG-IP DNS listener on how to handle TCP traffic. For more information on TCP profiles, please refer to the link below.

|tpc-profile_link|

.. |tpc-profile_link| raw:: html

   <a href="https://support.f5.com/csp/article/K10711911" target="_blank">More information on TCP profiles</a>

.. note:: **It is required to complete the following task on both gtm1.site1 and gtm1.site2**

|site1-tcp-profile_link|

.. |site1-tcp-profile_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/create.jsp" target="_blank">DNS  ››  Delivery : Profiles : Protocol : TCP</a>
                                              
|site2-tcp-profile_link|

.. |site2-tcp-profile_link| raw:: html

   On gtm1.site<b>2</b> navigate to: <a href="https://gtm1.site2.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/create.jsp" target="_blank">DNS  ››  Delivery : Profiles : Protocol : TCP</a>
   
.. image:: /_static/class1/dns_profile_tcp_flyout.png
   :align: left

Create a new TCP profile as shown in the following table.

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "example.com_tcp-dns_profile"
   "Parent Profile", "f5-tcp-wan"

.. image:: /_static/class1/dns_profile_tcp.png
   :align: left

TMSH Command for both gtm1.site and gtm1.site2:

.. admonition:: TMSH

   tmsh create ltm profile tcp example.com_tcp-dns_profile defaults-from f5-tcp-wan
