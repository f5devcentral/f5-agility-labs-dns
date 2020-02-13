Zone Runner
==============================

For the purpose of the lab, we will utilize Zonerunner to create a RPZ zone.

Navigate to **DNS  ››  Zones : ZoneRunner : Zone List**

.. image:: /class2/media/zonerunner_create_zone.png
   :scale: 50

Create a *new* zone according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "View Name", "external"
   "Zone Name", "rpz.example.com"
   "Zone Type", "Master"
   "Zone File Name", "db.external.rpz.example.com"
   "Options", "also-notify { ::1 port 5353; };"
   "TTL", "300"
   "Master Server", "router01.branch01.example.com."
   "Email Contact", "hostmaster.example.com."
   "NS Record: TTL", "300"
   "NS Record: Nameserver", "router01.branch01.example.com."
   "Create A Record", "Checked - Enabled"
   "A Record: IP Address", "10.1.20.252"

.. image:: /class2/media/zonerunner_create_zone_properties.png
   
Next, lets create some resource records in the new zone.

Navigate to: **DNS  ››  Zones : ZoneRunner : Resource Record List**

.. image:: /class2/media/zonerunner_create_resource_record.png
   :scale: 50

Create a resource record according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "View Name", "external"
   "Zone Name", "rpz.example.com"
   "Name", "\*.fuzzybunnies.com.rpz.example.com."
   "TTL", "300"
   "Type", "CNAME"
   "CNAME", "."

.. image:: /class2/media/zonerunner_create_resource_record_properties.png

Finally, set the type to *All* to find all records and click search to see all records: 

.. image:: /class2/media/zonerunner_list_resource_records.png
