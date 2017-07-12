TCP Profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Profiles : Protocol : TCP**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/profile/tcp/list.jsp?

Create a TCP profile as shown in the following table.
 
.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_tcp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. image:: /_static/class2/router01_create_tcp_profile.png
   :width: 800

.. image:: /_static/class2/router01_create_tcp_profile_properties.png
   :width: 800

.. admonition:: TMSH

   tmsh create ltm profile tcp example.com_tcp-dns_profile defaults-from f5-tcp-lan
