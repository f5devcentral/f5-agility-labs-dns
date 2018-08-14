Data Centers
############################################

.. toctree::
   :maxdepth: 1
   :hidden:
   :glob:

   task*

Datacenters are logical groupings of services or applications that are typically located within the same physical location such as a Data Center. The Data Center configuration will allow BIG-IP DNS to understand the location of your services for the purposes of high availibility. For more information on Data Centers, please refer to the link below.

Perform configuration changes on gtm1.site1. The reason for this is that by the end of this lab we will demonstrate how BIG-IP DNS Synchronization works to ensure configuration consistency is maintained between both BIG-IP DNS devices. Once Synchronization is established, gtm1.site2 will receive a copy of these new configurations.

|datacenter_link|

.. |datacenter_link| raw:: html

   <a href="https://support.f5.com/csp/article/K62640222" target="_blank">More information on Data Centers</a>


.. note::   The tasks in this section are to be only completed on gtm1.site1 

|site1-datacenter_link|

.. |site1-datacenter_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/data_center/create.jsp" target="_blank">DNS > GSLB : Data Centers : Data Center List: Create</a>

.. image:: ../../media/create_datacenters_flyout.png
   :align: left

Create two data centers according to the table below:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Name", "site1_datacenter"
   "Name", "site2_datacenter"

.. image:: ../../media/create_datacenters.png
   :align: left

TMSH command for only site1.gtm1:

.. admonition:: TMSH

   tmsh create gtm datacenter site1_datacenter

.. admonition:: TMSH

   tmsh create gtm datacenter site2_datacenter


