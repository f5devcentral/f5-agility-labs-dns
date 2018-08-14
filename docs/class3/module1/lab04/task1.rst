Servers
==============================

.. toctree::
   :hidden:
   :maxdepth: 1
   :glob:

   lab1/task*

Server objects represent a system such as an application delivery controller which host a service. A server can be a BIG-IP system, a third party ADC or a third-party host server such as a web or database server. In this task we will create a server on gtm1.site1 referencing gtm1.site2, which is required for config synchronization. 

When we create a BIG-IP server with auto-discovery enabled (which we will do), BIG-IP DNS will discover all of the virtual servers defined on the BIG-IP LTM. For more information on Servers, please refer to the link below.

|servers_link|

.. |servers_link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-concepts-12-0-0/5.html" target="_blank">More information on Servers</a>


|site1_list_servers_link|

.. |site1_list_servers_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/list.jsp" target="_blank">DNS  ››  GSLB : Servers : Server List</a>

.. image:: ../../media/gslb_servers_flyout.png
   :align: left

Click the create button and continue to define objects

.. image:: ../../media/server_create_none.png
   :align: left
