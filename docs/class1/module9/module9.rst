LB Methods
###############################

Modify the GSLB configuration so that siteb is a standby DR site.

Introduce a network problem that causes the app1 link monitor to fail.

A network outage can automatically cause DR activation.

#. On dns.sitea navigate to: **DNS  ››  GSLB : Pools : Pool List  ››  Members : www.f5demo.com_pool**

   .. image:: /_static/class1/gslb_pool_persistence_flyout.png
      :width: 800

#. Modify the "Load Balancing Method" -> "Preferred" to "Global Availability"

   .. image:: /_static/class1/gslb_pool_global_availability_details.png
      :width: 800

   .. admonition:: TMSH

      tmsh modify gtm pool a www.f5demo.com_pool load-balancing-mode global-availability

#. Introduce a network problem at sitea and disable the virtual server

   On ltm.sitea navigate to: **Local Traffic  ››  Virtual Servers: Virtual Server List  ››  Virtual Server: app1_sitea_www.f5demo.com_tcp_https_virtual**

   .. image:: /_static/class1/router_disable_isp1_site_interface.png
      :width: 800
  
   .. admonition:: TMSH - Run on ltm.sitea

      tmsh modify ltm virtual app1_sitea_www.f5demo.com_tcp_https_virtual disabled

#. View the effect

   On the jumpbox, open chrome, and navigate to https:www.f5demo.com:

   .. image:: /_static/class1/dns_gslb1_site2_links.png
      :width: 800

#. Set the sitea virtual server back up and enable the virtual server

   On ltm.sitea navigate to: **Local Traffic  ››  Virtual Servers: Virtual Server List  ››  Virtual Server: app1_sitea_www.f5demo.com_tcp_https_virtual**

   .. image:: /_static/class1/router_enable_isp1_site_interface.png
      :width: 800

   .. admonition:: TMSH - Run on ltm.sitea

      tmsh modify ltm virtual app1_sitea_www.f5demo.com_tcp_https_virtual enabled

