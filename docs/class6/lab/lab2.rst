F5 DNS Cloud Service - UI
=========================

Create Secondary DNS Zone
-------------------------

Let’s now return to the F5 Cloud Services portal and create Secondary DNS Zone using the UI. We will repeat the same flow through the API in the subsequent section.  

a. Go to the **DNS** tab and click **Create**. 

   .. figure:: ../_figures/10.png 

#. Paste **Zone name** retrieved in step 4.e) above and indicate the following DNS IP: **54.211.12.173** as the DNS Primary Server IP. Other values are optional. Then click **Get Zone File**.

   .. figure:: ../_figures/11.png  

#. This will retrieve the zone file from your primary DNS server. Click **Deploy** and then **Done**. This will create Secondary DNS Zone.    
   
   .. figure:: ../_figures/75.png 

Query via Browser  
-----------------

Let’s now see how the created Secondary DNS works. 

a. Click on your zone in the **DNS** tab and scroll down to see **ZONE FILE**, where you need to copy “na1-auction.user-**your_zone_name**”.  

   .. figure:: ../_figures/12.png 

#. Paste the address into your browser and you’ll get to the website: 

   .. figure:: ../_figures/13.png 

Delete Zone 
-----------

In case you need to delete the zone, tick your zone, click **Delete** and then confirm your choice.   

.. figure:: ../_figures/14.png
