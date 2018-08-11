BIG-IQ with DNS
=====================

.. toctree::
   :maxdepth: 1
   :hidden:
   :glob:

   task*

BIG-IQ is an F5 product that offers centralized management and monitorting as well as data collection and reporting of BIG-IP products. In this exercise we will add both of our BIG-IP DNS systems into BIG-IQ to demonstrate the power of BIG-IQ.

|settings_KB_link|

.. |settings_KB_link| raw:: html

   <a href="https://support.f5.com/csp/article/K13734" target="_blank">A site specific sync-group name will synchronize configuration settings and metrics information</a>

|site1-settings_link|

.. |site1-settings_link| raw:: html

   On gtm1.site<b>1</b> navigate to: <a href="https://gtm1.site1.example.com/tmui/Control/jspmap/tmui/dns/settings/gslb/properties_general.jsp" target="_blank">DNS  ››  Settings : GSLB : General</a>

.. image:: /_static/class1/gtm_global_settings.png
   :align: left

Configure the global settings for GSLB according to the following table:

.. csv-table::
   :header: "Field", "Value"
   :widths: 15, 15

   "Synchronize", "checked"
   "Group Name", "EXAMPLE_group"
   "Synchronize DNS Zone Files", "checked"

The above work may alternatively be completed using the command line. Using Putty log into gtm1.site1 and issue the following command.

.. admonition:: TMSH

   tmsh modify gtm global-settings general synchronization yes synchronization-group-name EXAMPLE_group synchronize-zone-files yes
