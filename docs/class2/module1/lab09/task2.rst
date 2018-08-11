POST
=====================

Authentication tokens have been acquired in the previous step, and will be used to create new BIG-IP DNS configurations. A new FTP service will be created, which includes the automated creation of a new pool and a Wide-IP.

Using the Postman application, select the "API" collection, and navigate to each of the next 4 requests and click Send for each.

.. image:: /_static/API-POST.png
   :align: left

Once complete, login to gtm1.site1 via Web interface and look for the new configuration elements to confirm that they were successfully created. Do the same on gtm1.site2.
