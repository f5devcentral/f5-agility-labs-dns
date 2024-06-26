Datacenters
############################################

Datacenters are logical groupings of devices that share a gateway.

.. note::   The tasks in this section are to be completed only on dns.sitea

Navigate to: **DNS > GSLB > Data Centers > Data Center List: Create**

.. image:: /_static/class1/create_datacenters_flyout.png
   :width: 800

.. https://gtm1.site1.example.com/tmui/Control/jspmap/xsl/gtm_dc/list

Create two data centers according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "sitea_datacenter"
   "Name", "siteb_datacenter"

.. image:: /_static/class1/create_datacenters.png
   :width: 800

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/globallb/data_center/create.jsp

TMSH command for only sitea.dns:

.. admonition:: TMSH

   tmsh create gtm datacenter sitea_datacenter

.. admonition:: TMSH

   tmsh create gtm datacenter siteb_datacenter

.. toctree::
   :maxdepth: 1
   :hidden:
   :glob:

   lab*

