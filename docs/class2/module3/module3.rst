Transparent Cache
-------------------

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

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*
