Device Trust
###############################################

A mesh of F5 DNS servers need to exchange keys to establish a trusted mechanism for HA communications.

.. image:: /_static/class1/establish_trust.png
   :width: 800

Launch WebRDP "Guacomole" and login (username : user password : user)

.. image:: /_static/class1/system_webrdp.PNG
   :width: 800

Expand Jumpbox_Windows10_RDP & double-click on Jumpbox_Windows10_RDP

.. image:: /_static/class1/jumpbox_windows10.PNG
   :width: 800

Launch Putty and login to dns.sitea.f5demo.com (username : root & password : default)

Run the following command:

When prompted for a password use "default".

.. admonition:: TMSH

   bigip_add

.. image:: /_static/class1/putty_gtm1_site1.png
   :width: 800

Navigate to: **DNS  ››  GSLB : Servers : Trusted Server Certificates**

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/locallb/ssl_certificate/properties.jsp?certificate_name=server&store=iquery

.. image:: /_static/class1/gslb_dataceter_servers_trusted_certificates.png
