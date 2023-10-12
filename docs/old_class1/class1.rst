Class 1 - Intro to GSLB
=====================================================

.. image:: /_static/class1/class1_availability.png

* Students will configure F5 DNS servers to support GSLB services on a single device in site1.
* Join an additional F5 DNS server in site2 to the GSLB cluster.
* An Internal group of DNS servers is authoritative for the zone example.com and contains a static A record for "www.example.com", which resolves to 203.0.113.9.
* Students will add glue records and delegate gslb.example.com to the F5 GSLB DNS servers.
* Convert the A record "www.example.com" to be a CNAME record pointing to *www.gslb.example.com*.

At the end of the lab students will have configured F5 GSLB DNS servers to alternately resolve www.example.com to 203.0.113.9 and 198.51.100.41

.. toctree::
   :hidden:
   :numbered:
   :maxdepth: 2
   :glob:

   module*/module*
