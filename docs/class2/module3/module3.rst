Validating Resolver
##########################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*

Configure a validating resolver cache on the BIG-IP® system to recursively query public DNS servers, validate the identity of the DNS server sending the responses, and then cache the responses.

After completing this lab students will entirely offload DNS queries from internal masters.

.. image:: /_static/class2/class2_validating-resolver.png

.. image:: /_static/class2/class2_validating-resolver2.png

Navigate to **DNS  ››  Caches : Cache List**

.. image:: /_static/class2/cache_list_flyout.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/list.jsp

Create a validating resolver cache according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "validating-resolver_cache"
   "Resolver Type", "Validating Resolver"
   "Answer default zones", "Checked - Enabled"

.. image:: /_static/class2/cache_validating-resolver.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/create.jsp

.. admonition:: TMSH

   tmsh create ltm dns cache validating-resolver validating-resolver_cache answer-default-zones yes

https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-services-implementations-12-1-0/7.html#guid-d4548549-b4e2-4dae-9ada-3ea00eb84c1f
