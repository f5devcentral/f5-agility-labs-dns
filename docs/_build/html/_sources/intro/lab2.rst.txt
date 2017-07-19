IPv4
==================

Management IP Addresses:

.. csv-table::
   :header: "Host", "Managment"
   :widths: 15, 15
   
   "bigip1.site1", "10.1.10.11"
   "bigip2.site1", "10.1.10.12"
   "gtm1.site1", "10.1.10.13"
   "bigip1.site2", "10.1.10.21"
   "bigip2.site2", "10.1.10.22"
   "gtm1.site2", "10.1.10.23"
   "router01.branch01", "10.1.10.31"

Service IP Addresses:

.. csv-table::
   :header: "Site 1", "Site 2"
   :widths: 15, 15

   "www.example.com = 203.0.113.9", "www.example.com = 198.51.100.41"
   "vpn.example.com = 203.0.113.10", "vpn.example.com = 198.51.100.42"
