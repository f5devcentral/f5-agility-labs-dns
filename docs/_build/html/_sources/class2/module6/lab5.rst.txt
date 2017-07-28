Walled Garden
#####################################

Navigate to: **DNS  ››  Caches : Cache List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/list.jsp

Click "validating-resolver_cache"

.. image:: /_static/class2/select_validating-resolver_cache.png

Select validating-resolver_cache, click "Response Policy Zones", and then click "Add"

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/rpz/list.jsp?name=%2FCommon%2Fvalidating-resolver_cache&tab=dns_cache_config

.. image:: /_static/class2/cache_enable_rpz.png

Create a local zone entry according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Zone", "rpz.example.com"
   "Action", "Walled Garden"
   "Walled Garden", "sorry.example.com"

.. image:: /_static/class2/cache_enable_rpz_details.png

TMSH commands for router01.branch01:

.. admonition:: TMSH

   tmsh modify ltm dns cache resolver validating-resolver_cache response-policy-zones add { rpz.example.com { action walled-garden walled-garden sorry.example.com } }

