Settings
=====================

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:
   
   task*

First of all, we will begin to configure a Sync-Group between our BIG-IP DNS servers. This will allow for DNS-related configurations to be kept in a consistent state between both BIG-IP DNS servers at all times. Please see the article below for more information on BIG-IP DNS synchronization.

|settings_KB_link|

.. |settings_KB_link| raw:: html

   <a href="https://support.f5.com/csp/article/K13734" target="_blank">More on BIG-IP DNS Synchronization</a>

.. note::  **This enables Config Sync on gtm1.site1 only. Config Sync for gtm1.site2 will be enabled at a later step.**

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
