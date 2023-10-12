LB Methods
###############################

Modify the GSLB configuration so that siteb is a standby DR site.

Introduce a network problem that causes the app1 link monitor to fail.

A network outage can automatically cause DR activation.

#. On dns.sitea navigate to: **DNS  ››  GSLB : Pools : Pool List  ››  Members : www.f5demo.com_pool**

 ..  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/pool/members.jsp?name=%2FCommon%2Fwww.example.com_pool&pool_type=1&identity=www.example.com_pool

   .. image:: /_static/class1/gslb_pool_persistence_flyout.png
      :width: 800

#. Modify the "Load Balancing Method" -> "Preferred" to "Global Availability"

   .. image:: /_static/class1/gslb_pool_global_availability_details.png
      :width: 800

   .. admonition:: TMSH

      tmsh modify gtm pool a www.f5demo.com_pool load-balancing-mode global-availability

#. Introduce a network problem at sitea and disable the virtual server

   On ltm.sitea navigate to: **Local Traffic  ››  Virtual Servers: Virtual Server List  ››  Virtual Server: app1_sitea_www.f5demo.com_tcp_https_virtual**

 ..  https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/network/interface/list.jsp

   .. image:: /_static/class1/router_disable_isp1_site_interface.png
      :width: 800

   TMSH command to run on ltm.sitea to simulate a failure   

   .. admonition:: TMSH

      tmsh modify ltm virtual app1_sitea_www.f5demo.com_tcp_https_virtual disabled

#. View the effect

   Log into the jumpbox (username: Administrator password: VkEZNEFnnLH) , open chrome, and navigate to https:www.f5demo.com:

   .. image:: /_static/class1/dns_gslb1_site2_links.png
      :width: 800

 ..  https://gtm1.site2.example.com/tmui/Control/jspmap/xsl/gtm_link/list   

#. Set the sitea virtual server back up and enable the virtual server

   On ltm.sitea navigate to: **Local Traffic  ››  Virtual Servers: Virtual Server List  ››  Virtual Server: app1_sitea_www.f5demo.com_tcp_https_virtual**

 ..  https://router01.branch01.example.com/tmui/Control/jspmap/tmui/locallb/network/interface/list.jsp

   .. image:: /_static/class1/router_enable_isp1_site_interface.png
      :width: 800

   .. admonition:: TMSH

      tmsh modify ltm virtual app1_sitea_www.f5demo.com_tcp_https_virtual enabled

Note: Even though you re-enabled the primary site1, a persistence record from the previous lab is still in place.
