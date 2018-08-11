Transparent Cache
#####################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*

In this module we will prepare the objects required to build a transparent cache.

In the next exercise a DNS profile will reference the cache and a Listener will forward traffic to a healthy backend DNS server

.. image:: /_static/class2/before_transparent_cache.png

Enabling a transparent cache on the BIG-IP will offload some DNS queries from being sent to the internal DNS servers.

.. image:: /_static/class2/transparent_cache_enabled.png

Log into the gateway device router01.brancho1 in the **branch office**

Navigate to **DNS  ››  Caches : Cache List**

Create a transparent cache

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "transparent_cache"
   "Resolver Type", "Transparent"

.. image:: /_static/class2/cache_transparent.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/create.jsp

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns cache transparent transparent_cache

