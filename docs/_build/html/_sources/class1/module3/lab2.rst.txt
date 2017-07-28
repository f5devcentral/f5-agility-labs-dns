Device Trust
###############################################

A mesh of F5 DNS servers need to exchange keys to establish a trusted mechanism for HA communications.

.. image:: /_static/class1/establish_trust.png

Launch Putty and login to gtm1.site1.example.com

Run the following command:

When prompted for a password use "default".

.. admonition:: TMSH

   bigip_add

.. image:: /_static/class1/putty_gtm1_site1.png

Navigate to: **DNS  ››  GSLB : Servers : Trusted Server Certificates**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/locallb/ssl_certificate/properties.jsp?certificate_name=server&store=iquery

.. image:: /_static/class1/gslb_dataceter_servers_trusted_certificates.png
