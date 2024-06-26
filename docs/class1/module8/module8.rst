Persistence
###############################

Modify the GSLB configuration so that LDNS servers continually receive the same DNS answer.

#. On dns.sitea navigate to: **DNS  ››  GSLB : Pools : Pool List  ››  Members : www.f5demo.com_pool**

   .. image:: /_static/class1/gslb_wideip_list.png
      :width: 800

 ..  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/list.jsp

#. Click into the "Pools" tab:

   .. image:: /_static/class1/gslb_wideip_list_members.png
      :width: 800

 ..  https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/pools.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com

#. Enable Persistence

   .. image:: /_static/class1/gslb_wideip_persistence_enabled.png
      :width: 800

   .. admonition:: TMSH

      tmsh modify gtm wideip a www.wip.f5demo.com persistence enabled

#. View Persistence Records - There won't be any records at this time

   .. admonition:: TMSH

      tmsh show gtm persist

#. From the Windows 10 jumpbox, test resolution for www.f5.demo.com multiple times (dig www.f5demo.com).  It will resolve to the same IP each time

#. Recheck Persistence Records - You should see a persistence record for the Windows 2019 Server that is making the query for the Windows 10 client

   .. admonition:: TMSH - Run from either dns.sitea or dns.siteb

      tmsh show gtm persist

#. Disable persistence

   .. admonition:: TMSH - Run from either dns.sitea or dns.siteb

      tmsh modify gtm wideip a www.wip.f5demo.com persistence disabled
