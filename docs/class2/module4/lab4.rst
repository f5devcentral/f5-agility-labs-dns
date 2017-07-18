DNSSEC signed zone
###################

Navigate to: **DNS  ››  Zones : DNSSEC Zones : DNSSEC Zone List**

.. image:: /_static/class2/dnssec-zone.png

Create DNS Express zone signed by DNSSEC

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, www.example.com
   Zone Signing Key, example.com_zsk
   Key Signing Key, example.com_ksk

.. image:: /_static/class2/dnssec-new-zone.png

https://router01.branch01.example.com/tmui/Control/form?__handler=/tmui/dns/dnssec_zone/list&__source=delete_confirm&__linked=false&__fromError=false

TMSH commands for DNSSEC signed zone creation:

.. admonition:: TMSH

 tmsh create ltm dns dnssec zone example.com keys add { example.com_ksk example.com_zsk }
