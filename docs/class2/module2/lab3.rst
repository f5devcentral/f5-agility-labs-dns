UDP Profile
#####################################

A UDP profile is a protocol profile that controls the way the platform processes UDP traffic. With DNS, custom UDP profiles are often used to set low idle times and preseve memory in the connection table as DNS tends to be a lot of short lived connectetions. 


Navigate to: **DNS  ››  Delivery : Profiles : Protocol : UDP**

.. image:: /class2/media/router01_create_udp_profile.png


Create a UDP profile as shown in the following table. By inheriting from the non default *UDP* profile, notice the idle timeout setting. 
 
.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "example.com_udp-dns_profile"
   "Parent Profile", "udp_gtm_dns"

.. image:: /class2/media/router01_create_udp_profile_properties.png


.. admonition:: TMSH

   tmsh create ltm profile udp example.com_udp-dns_profile defaults-from udp_gtm_dns
