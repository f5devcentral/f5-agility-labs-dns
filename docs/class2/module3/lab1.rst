Zone Runner
==============================

It is possible to create a custom RPZ zone rather than subscribing to an RPZ vendor.

Navigate to **DNS  ››  Zones : ZoneRunner : Zone List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/globallb/zfd/zone/create.jsp

Click Create button

.. image:: /_static/class2/zonerunner_create_zone.png

Create a zone accordign to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "View Name", "external"
   "Zone Name", "rpz.example.com"
   "Zone Type", "Master"
   "Zone File Name", "db.external.rpz.example.com"
   "Options", "also-notify { ::1 port 5353; };"
   "TTL", "300"
   "Master Server", "router01.branch01.example.com"
   "Email Contact", "hostmaster.example.com"

.. image:: /_static/class2/zonerunner_create_zone_properties.png

Navigate to: **DNS  ››  Zones : ZoneRunner : Resource Record List**

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/globallb/zfd/record/create.jsp

Click the Create button

.. image:: /_static/class2/zonerunner_create_resource_record.png

Create a resource record accoring to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "View Name", "external"
   "Zone Name", "rpz.example.com"
   "Name", "\*.guns.com.rpz.example.com"
   "TTL", "300"
   "Type", "CNAME"
   "CNAME", "."

.. image:: /_static/class2/zonerunner_create_resource_record_properties.png

.. image:: /_static/class2/zonerunner_list_resource_records.png
