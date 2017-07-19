UDP Profile
#####################################

Navigate to: **Local Traffic  ››  Profiles : Protocol : UDP**

.. image:: /_static/class2/router01_create_udp_profile.png

Create a UDP profile as shown in the following table.
 
.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_udp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. image:: /_static/class2/router01_create_udp_profile_properties.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/udp/create.jsp

.. admonition:: TMSH

   tmsh create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns
