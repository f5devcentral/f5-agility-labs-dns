Device Trust
###############################################

A group of F5 DNS servers must exchange keys to establish a trusted mechanism for HA communications and Config Sync. In this task we will establish device trust between gtm1.site1 and gtm1.site2. For more information on device trust, please refer to the link below. 

|device-trust_link|

.. |device-trust_link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-redundant-systems-config-11-2-0/3.html" target="_blank">More information on Device Trust</a>


.. image:: ../../media/establish_trust.png
   :align: left

#. Launch Putty and login to gtm1.SITE1

   Run the following command, and when prompted for a password use "default"

   .. admonition:: TMSH

      bigip_add

   .. image:: ../../media/putty_gtm1_site1.png
      :align: left

#. Observe the exchanged certificates

   |site1-view-trust-certs_link|

   .. |site1-view-trust-certs_link| raw:: html

      On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/locallb/ssl_certificate/properties.jsp?certificate_name=server&store=iquery" target="_blank">DNS  ››  GSLB : Servers : Trusted Server Certificates</a>

   .. image:: ../../media/gslb_dataceter_servers_trusted_certificates.png
      :align: left

#. Observe the server status

   |site1-view-server_status_link|

   .. |site1-view-server_status_link| raw:: html

      On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp" target="_blank">DNS  ››  GSLB : Servers : Server List</a>

   .. image:: ../../media/green_green_green.png
      :align: left
      
.. note::  **If your server list is not green, do not proceed to the next step. Please confirm that the device trust is complete and troubleshoot the issue.**

