Persistence
###############################

Modify the GSLB configuration so that LDNS servers continually receive the same DNS answer.

#. On gtm1.site1 navigate to: **DNS  ››  GSLB : Pools : Pool List  ››  Members : www.example.com_pool**

   .. image:: /_static/class1/gslb_wideip_list.png

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/list.jsp

#. Click into the "Pools" tab:

   .. image:: /_static/class1/gslb_wideip_list_members.png

   https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/wideip/pools.jsp?name=%2FCommon%2Fwww.gslb.example.com&type=1&identity=www.gslb.example.com

#. Enable Persistence

   .. image:: /_static/class1/gslb_wideip_persistence_enabled.png

   .. admonition:: TMSH

      tmsh modify gtm wideip a www.gslb.example.com persistence enabled

#. View Persistence Records

   .. admonition:: TMSH

      tmsh show gtm persist
