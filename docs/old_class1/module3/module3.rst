Datacenters
############################################

Datacenters are logical groupings of devices that share a gateway.

.. note::   The tasks in this section are to be only completed on gtm1.site1

Navigate to: **DNS > GSLB > Data Centers > Data Center List: Create**

.. image:: /_static/class1/create_datacenters_flyout.png

https://gtm1.site1.example.com/tmui/Control/jspmap/xsl/gtm_dc/list

Create two data centers according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "site1_datacenter"
   "Name", "site2_datacenter"

.. image:: /_static/class1/create_datacenters.png

https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/data_center/create.jsp

TMSH command for only site1.gtm1:

.. admonition:: TMSH

   tmsh create gtm datacenter site1_datacenter

.. admonition:: TMSH

   tmsh create gtm datacenter site2_datacenter

.. toctree::
   :maxdepth: 1
   :hidden:
   :glob:

   lab*

