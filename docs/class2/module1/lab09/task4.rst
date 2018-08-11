Active/Standby
=====================

Create a brand new configuration element that is relevant to a disaster recovery design, where site 2 is converted to a standby site.

In order to make site2 a standby site, modify the load balancing method of each of its pools from "Preferred" to "Global Availability". Demonstrate the behavior using the dig command on the Jumpbox. For more information on GSLB load balancing please refer to the link below.

|as-link|

.. |as-link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip_gtm/manuals/product/gtm-concepts-11-3-0/1.html" target="_blank">More information on GSLB Load Balancing methods</a>

Open Postman and send both of the patch commands below.

  .. image:: /_static/API-AS.png
   :align: left

Login to the web interface of both gtm1.site1 and gtm1.site2 to witness the change. Confirm with dig that the load balancing method is working as intended, what has changed? You should now be seeing a consistent DNS respone when querying either ftp.example.com or www.example.com instead of the round robin behavior.


