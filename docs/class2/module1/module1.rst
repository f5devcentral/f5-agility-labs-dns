Transparent Cache
#####################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*

In this module we will prepare the objects required to build a transparent cache.

In the next exercise a DNS profile will reference the cache and a Listener will forward traffic to a healthy backend DNS server

.. image:: /class2/media/before_cache.png

Enabling a transparent cache on the BIG-IP will offload some DNS queries from being sent to the internal DNS servers.

.. image:: /class2/media/transparentcache_enabled.png

Log into the gateway device **router01.branch01** *(bigip01)* in the **branch office** using the Chromium Browser on your desktop with the credentials u:**admin** p:**admin**

Navigate to **DNS  ››  Caches : Cache List**

Create a transparent cache

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "transparent_cache"
   "Resolver Type", "Transparent"

.. image:: /class2/media/cache_transparent.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/create.jsp

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns cache transparent transparent_cache

