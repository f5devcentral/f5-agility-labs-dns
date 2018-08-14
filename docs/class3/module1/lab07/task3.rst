CNAME
=================================

A CNAME (Canonical name record) functions as an alias for another domain name. Create a CNAME for "www" an as alias to www.gslb.example.com. When configured, this will result in a query for www.example.com to be directed to the name www.gslb.example.com where a subsequent A record query will be resolved.

#. Make sure "Forward Lookup Zones" and "EXAMPLE.COM" is expanded. Right click on "www", and select delete.

   .. image:: ../../media/dc01_new_delegation_delete_www.png

#. Right click on "EXAMPLE.COM", and select "New Alias (CNAME)"

   .. image:: ../../media/dc01_new_delegation_create_cname.png

#. Add "www - www.gslb.example.com"

   .. image:: ../../media/dc01_new_delegation_create_cname_finish.png
