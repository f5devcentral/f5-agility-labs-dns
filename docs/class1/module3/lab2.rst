Device Trust
###############################################

A mesh of F5 DNS servers need to exchange keys to establish a trusted mechanism for HA communications.

.. image:: /_static/class1/establish_trust.png
   :width: 800

Launch Web Shell to Site A DNS

.. image:: /_static/class1/dns_sitea_web_shell.png
   :width: 600


Run the following command:

Enter 'yes' for any connectivity prompts.  When prompted for a password use "F5demo!!".

.. admonition:: TMSH

   bigip_add

.. image:: /_static/class1/bigip_add.png
   :width: 800

The 'bigip_add' command pulls the management certificate from the destination BIGIP devices for use during the encrypted iQuery channel setup between GSLB servers in the cluster. When running 'bigip_add' without any options, the command will be run against all BIGIP devices in the GSLB Server list using current username to connect to the endpoints.  You can specifiy a connection username or endpoint IP(s) if needed.

::

   bigip_add <user>@<endpoint_IP>
   bigip_add <endpoint_IP>
   bigip_add <endpoint_IP1> <endpoint_IP2>

Navigate to: **DNS  ››  GSLB : Servers : Trusted Server Certificates**

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/locallb/ssl_certificate/properties.jsp?certificate_name=server&store=iquery

.. image:: /_static/class1/gslb_dataceter_servers_trusted_certificates.png
   :width: 800
