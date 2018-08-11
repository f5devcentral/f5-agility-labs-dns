site1_ha-pair
###############################################

We will now add both BIG-IP clusters to our list of servers. Doing so, allows the BIG-IP DNS to perform monitoring of each cluster to evaluate their capability to process traffic. 

In this configuration we will enable both virtual server discovery and link discovery. Virtual server discovery allows BIG-IP DNS to find the list of all virtual servers that are created on each BIG-IP cluster, you will see the benefit of this later. Link discovery allows BIG-IP DNS to automatically add and monitor the upstream link that the BIG-IP LTM cluster is dependent on for Internet access; this can be then used to evaluate failover decision. 

.. image:: /_static/class1/server_create_gtm1-gtm2.png
   :align: left

|site1-create_site1_ha-pair_link|

.. |site1-create_site1_ha-pair_link| raw:: html

   On gtm1.site<b>1</b> <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/server/create.jsp" target="_blank">create a server object</a> according the table below:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "site1_ha-pair"
   "Data Center", "site1_datacenter"
   "Devices Add:", "bigip1.site1.example.com : 203.0.113.5"
   "Devices Add:", "bigip2.site1.example.com : 203.0.113.6"
   "Health Monitors", "bigip"
   "Virtual Server Discovery", "Enabled"
   "Link Discovery", "Enabled"

#. Fill in the Name and Datacenter

   .. image:: /_static/class1/site1_click-addserver.png
      :align: left

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site_ha_pair_bigip1_add.png
      :align: left

#. Click "Add" again to define the other BIG-IP in the HA pair.

   .. image:: /_static/class1/site1_click-addserver_again.png
      :align: left

#. Click the "Add" button to define IP addresses

   .. image:: /_static/class1/site_ha_pair_bigip2_add.png
      :align: left

#. Complete the form and associate the "bigip" "Health Monitor"

   .. image:: /_static/class1/site1-HA_pair_create.png
      :align: left

#. Make sure to enable both "Virtual Server" and "Link" discovery

   .. image:: /_static/class1/VS_and_link_auto_discovery.png
      :align: left

.. admonition:: TMSH

   tmsh create gtm server site1_ha-pair datacenter site1_datacenter devices add { bigip1.site1.example.com { addresses add { 203.0.113.5 { } } } bigip2.site1.example.com { addresses add { 203.0.113.6 { } } } } link-discovery enabled monitor bigip product bigip virtual-server-discovery enabled
