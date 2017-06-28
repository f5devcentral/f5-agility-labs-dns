Device Trust
###############################################

A mesh of F5 DNS servers need to exchange keys to establish a trusted mechanism for HA communications.

Lanch Putty and login to gtm1.site1.example.com

Run the following command:

.. code-block:: cli

   bigip_add

.. image:: /_static/class1/putty_gtm1.site1.png
   :width: 800

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/locallb/ssl_certificate/properties.jsp?certificate_name=server&store=iquery

.. image:: /_static/class1/gslb_dataceter_servers_trusted_certificates.png
   :width: 800
