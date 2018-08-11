Local Zone
#####################################

Navigate to: **DNS  ››  Caches : Cache List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/list.jsp

.. image:: /_static/class2/select_validating-resolver_cache.png

Select validating-resolver_cache, click "Local Zones", and click "Add"

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/local_zone/list.jsp?name=%2FCommon%2Fvalidating-resolver_cache&tab=dns_cache_config

.. image:: /_static/class2/cache_create_local-zone.png

Create a local zone entry according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "sorry.example.com"
   "Type", "Static"
   "Records", "sorry.example.com. IN A 10.1.71.21"

.. image:: /_static/class2/create_localzone_entry.png

TMSH commands for router01.branch01:

.. code-block:: tcl

   tmsh modify ltm dns cache validating-resolver validating-resolver_cache local-zones { { name sorry.example.com records add { "sorry.example.com. IN A 10.1.71.21" } type static } }

