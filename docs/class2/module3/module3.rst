Validating Resolver
##########################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*

Configure a validating resolver cache on the BIG-IP® system to recursively query public DNS servers, validate the identity of the DNS server sending the responses, and then cache the responses.

After completing this lab the BIG-IP will handle secured recursive cache for DNS.

.. image:: /_static/class2/class2_validating-resolver.png

Log into the gateway device router01.brancho1 in the **branch office**

Navigate to **DNS  ››  Caches : Cache List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/cache/create.jsp

.. image:: /_static/class2/cache_list_flyout.png

Create a validating resolver cache according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "validating-resolver_cache"
   "Resolver Type", "Validating Resolver"
   "Answer default zones", "Checked - Enabled"

.. image:: /_static/class2/cache_validating-resolver.png

TMSH command for router01.branch01:

.. admonition:: TMSH

   tmsh create ltm dns cache validating-resolver validating-resolver_cache answer-default-zones yes

Assign validating-resolver_cache to the DNS profile. 
Navigate to **DNS  ››  Delivery ›› Profiles: DNS** and click on example.com_dns_profile

.. image:: /_static/class2/cache-assign.png

Change DNS cache name to validating-resolver_cache

.. image:: /_static/class2/cache-swap.png

.. admonition:: TMSH

   tmsh modify ltm profile dns example.com_dns_profile cache validating-resolver_cache


https://support.f5.com/kb/en-us/products/big-ip-dns/manuals/product/bigip-dns-services-implementations-12-1-0/7.html#guid-d4548549-b4e2-4dae-9ada-3ea00eb84c1f
