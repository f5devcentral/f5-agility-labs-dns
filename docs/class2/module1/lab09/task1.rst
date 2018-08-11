Authenticate
=====================

From the Jumpbox using the Postman application navigate to the "API" section under the Collections on the left. 

.. note::  **Config Sync has been enabled in previous lab tasks. All of the iControlREST configuration changes will be performed only on gtm1.site1 and changes will automatically synchronized to gtm1.site2**

#. Reveal the navigation panel in Postman

   .. image:: /_static/class2/jumpbox_postman_find_collection.png
      :align: left

#. Click on "Authenticate and Obtain Token from gtm1.site1". 

   .. image:: /_static/API-Authenticate-Complete.png
      :align: left

#. Click on the "Send" button in the top right. 

   .. image:: /_static/API1-b.png
      :align: left

#. Open the respone body and observe the received token. The token value is dynamic and your result will not be the same as illustrated below. The token received will be used for all subsequent authenticated actions with the BIG-IP DNS.

   .. image:: /_static/API1-c.png
      :align: left
