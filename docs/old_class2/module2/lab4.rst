TCP Profile
###################################

A TCP profile controls the way the platform processes TCP traffic.

Navigate to: **DNS  ››  Delivery : Profiles : Protocol : TCP**

.. image:: /_static/class2/router01_create_tcp_profile.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/list.jsp

Create a TCP profile as shown in the following table.
 
.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_tcp-dns_profile"
   "Parent Profile", "f5-tcp-lan"

.. image:: /_static/class2/router01_create_tcp_profile_properties.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/profile/tcp/create.jsp

.. admonition:: TMSH

   tmsh create ltm profile tcp example.com_tcp-dns_profile defaults-from f5-tcp-lan
