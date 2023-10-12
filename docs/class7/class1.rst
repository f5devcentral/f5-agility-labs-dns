Class 7 - Intro to GSLB (Updated)
=====================================================

.. image:: /_static/class7/class7_availability.png

* Students will configure F5 DNS servers to support GSLB services on a single device in sitea.
* Join an additional F5 DNS server in siteb to the GSLB cluster.
* An Internal group of DNS servers is authoritative for the zone f5demo.com and contains a static A record for "www.f5demo.com", which resolves to 10.1.10.51.
* Students will add glue records and delegate gslb.f5demo.com to the F5 GSLB DNS servers.
* Convert the A record "www.f5demo.com" to be a CNAME record pointing to *www.gslb.f5demo.com*.

At the end of the lab students will have configured F5 GSLB DNS servers to alternately resolve www.example.com to 10.1.10.51 and 10.1.60.51

.. toctree::
   :hidden:
   :numbered:
   :maxdepth: 2
   :glob:

   module*/module*
