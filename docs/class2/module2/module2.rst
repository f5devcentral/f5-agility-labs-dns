Resolver Cache
-------------------

Log into the gateway device router01.brancho1 in the **branch office**

Navigate to **DNS  ››  Caches : Cache List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/list.jsp

Create a resolver cache

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "resolver_cache"
   "Resolver Type", "Resolver"

.. image:: /_static/class2/cache_resolver.png

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns cache resolver resolver_cache

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*
