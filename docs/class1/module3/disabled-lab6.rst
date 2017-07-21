Auto Discover
===========================

Auto discover can be helpful, but after initial setup it's recomended to disable it.

Navigate to **DNS  ››  GSLB : Servers : Server List  ››  Links : site1_ha-pair**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/links.jsp?&leaf_name=site1_ha-pair&name=%2FCommon%2Fsite1_ha-pair

Disable Link Auto Discovery

.. image:: /_static/class1/dns_gslb_datacenter_server_link_discovery.png

Navigate to **DNS  ››  GSLB : Servers : Server List  ››  Virtual Servers : site1_ha-pair**

https://gtm1.site1.example.com/tmui/Control/jspmap/xsl/gtm_server/virtual_servers?&leaf_name=site1_ha-pair&name=%2FCommon%2Fsite1_ha-pair

Disable Virtual Auto Discover and delete unused objects

.. image:: /_static/class1/dns_gslb_datacenter_server_virtual_discovery.png

.. note::  **Repeat the above operations for site2_ha-pair**

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/links.jsp?&leaf_name=site1_ha-pair&name=%2FCommon%2Fsite1_ha-pair

https://gtm1.site1.example.com/tmui/Control/jspmap/xsl/gtm_server/virtual_servers?&leaf_name=site2_ha-pair&name=%2FCommon%2Fsite2_ha-pair

.. admonition:: TMSH

   tmsh modify gtm server site1_ha-pair link-discovery disabled virtual-server-discovery disabled

   tmsh modify gtm server site2_ha-pair link-discovery disabled virtual-server-discovery disabled

   tmsh modify gtm server site1_ha-pair virtual-servers delete { /Common/isp1_site1_vpn.example.com_tcp_http_virtual /Common/isp1_site1_vpn.example.com_tcp_https_virtual /Common/isp1_site1_www.example.com_tcp_http_virtual }
   
   tmsh modify gtm server site2_ha-pair virtual-servers delete { /Common/isp2_site2_vpn.example.com_tcp_http_virtual /Common/isp2_site2_vpn.example.com_tcp_https_virtual /Common/isp2_site2_www.example.com_tcp_http_virtual }

