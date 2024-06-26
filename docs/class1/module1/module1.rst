Settings
=====================

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

.. note::  **It is required to complete the following task only on dns.sitea**

A site specific sync group name will be created, and synchronization will be enabled.

Navigate to: **DNS  ››  Settings : GSLB : General**

Configure the global settings for GSLB according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Synchronize", "checked"
   "Group Name", "F5DEMO_group"
   "Synchronize DNS Zone Files", "checked"

.. image:: /_static/class1/gtm_global_settings.png 
   :width: 800

.. https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/settings/gslb/properties_general.jsp

.. admonition:: TMSH

   tmsh modify gtm global-settings general synchronization yes synchronization-group-name F5DEMO_group synchronize-zone-files yes

https://support.f5.com/csp/article/K13734

https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-implementations-12-0-0/4.html
