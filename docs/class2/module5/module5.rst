Validating Resolver
##########################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*

Configure a validating resolver cache on the BIG-IP® system to recursively query public DNS servers, validate the identity of the DNS server sending the responses, and then cache the responses.

After completing this lab students will entirely offload DNS queries from internal masters.

.. image:: /class2/media/validating_resolver.png

.. image:: /class2/media/validating_resolver_whitehouse.png

Navigate to **DNS  ››  Caches : Cache List**

.. image:: /class2/media/cache_list_flyout.png

Create a validating resolver cache according to the table below:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "validating-resolver_cache"
   "Resolver Type", "Validating Resolver"
   "Answer default zones", "Checked - Enabled"

.. image:: /class2/media/cache_validating-resolver.png

.. admonition:: TMSH

   tmsh create ltm dns cache validating-resolver validating-resolver_cache answer-default-zones yes

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-dns-services-implementations-13-1-0/7.html
