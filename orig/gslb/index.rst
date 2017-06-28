############################################
GSLB
############################################

  Students will configure an F5 DNS server to support GSLB services on a single device in site1, and subsequently join an additional F5 DNS server in site2 to the GSLB cluster. A Windows AD DNS server is authoritative for the zone example.com and contains a static A record for "www.example.com", which resolves to 203.0.113.9. Students will add glue records and delegate gslb.example.com to the F5 GSLB DNS servers, and convert the A record "www.example.com" to be a CNAME record pointing
  to *www.gslb.example.com*. At the end of the lab students will observe that the F5 GSLB DNS servers will alternately resolve www.example.com to 203.0.113.9 and 198.51.100.41.

.. toctree::
   :maxdepth: 1
   :hidden:

   global-settings.rst
   profiles/index
   listeners/index
   datacenters/index
   pools.rst
   wip.rst
   delegation.rst
   l4_acl.rst
   usecases/index.rst
