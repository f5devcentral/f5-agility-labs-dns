Transparent Cache
#####################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*

Windows workstations use the local "Active Directory" for DNS resolution.

The Windows domain controller has a DNS server role installed and performs recursive DNS services.

.. image:: /_static/class2/before_transparent_cache.png

Enabling a transparent cache on the BIG-IP will offload some DNS queries from being sent to the Domain Controller.

.. image:: /_static/class2/transparent_cache_enabled.png

Log into the gateway device router01.brancho1 in the **branch office**

Navigate to **DNS  ››  Caches : Cache List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/list.jsp

Create a transparent cache

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "transparent_cache"
   "Resolver Type", "Transparent"

.. image:: /_static/class2/cache_transparent.png
   :width: 800

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns cache transparent transparent_cache

