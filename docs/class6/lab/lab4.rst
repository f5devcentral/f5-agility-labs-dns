F5 DNS Load Balancer Cloud Service - UI
=======================================

In this section we will use the F5 Cloud Services UI to set up the Load Balancer DNS record, add endpoints for our Auction app, add health checks, load balanced pools, and run through a few configuration options. 

Create F5 DNS Load Balancer Cloud Service
-----------------------------------------

Let’s now create DNS Load Balancer Service to be able to balance loads across multiple clouds (Azure & AWS) and provide global availability and performance with health-check and built-in DDoS protection. 

a. Go to the **DNS Load Balancer** tab and click **Create**. 

   .. figure:: ../_figures/16.png 

#. Enter name of the zone we `created before <#zone-name>`_ and click **Create**.  

   .. figure:: ../_figures/27.jpg 

   .. figure:: ../_figures/17.png 
   
   Your DNS Load Balancer instance will appear on the list but in **Inactive** status. You can change the status after creating load balanced record and pool.

Add Single Endpoint, Health Monitor, Pool and Default Geoproximity Rule
-----------------------------------------------------------------------

a. Create a Region

   Creating regions will allow grouping incoming requests by geographic areas and directing them to specific pools.   

   1. Click on DNS Load Balancer instance which we have just created and go to the **Regions** tab. Click **Create**.  
  
      .. figure:: ../_figures/18.png 

   2. Fill "usa" as "Region name" and select "North America" in "Include these continents". **Save** the created region.  
  
      .. figure:: ../_figures/19.png 
   
   Now all requests from North America will be covered by the "usa" region.  

#. Add A Health Monitor

   To distribute the load, DNS Load Balancer will need to monitor health of each IP Endpoint. So, let’s create a monitor.  

   1. Go to the **Monitors** tab and then click **Create**. 

      .. figure:: ../_figures/20.png 

   2. Fill in "health-monitor" name, choose "HTTP Standard" protocol, indicate "80" port and click **Save**.   

      .. figure:: ../_figures/21.png 
   
#. Add an IP Endpoint (NA) with Health Check

   Let’s now create an IP endpoint that will currently service all incoming requests. DNS Load Balancer chooses an IP endpoint based on request origin and configuration of IP endpoints, as well as IP Endpoint health. 

   1. Go to the **IP endpoints** tab and then click **Create**. 
  
      .. figure:: ../_figures/22.png 

   2. Fill in name ("na1-auction"), IP address ("34.229.48.248"), port ("80") and select the monitor we created above.  
  
      .. figure:: ../_figures/23.png 
   
#. Create a Pool

   Let's now create a pool and add a member to it. 

   1. Go to the **Pools** tab and then click **Create**. 
  
      .. figure:: ../_figures/24.png 

   2. Fill in "america" name, choose "round-robin" method and define TTL "30". Then click **Next**.  
  
      .. figure:: ../_figures/25.png 

   3. Click **Add Member** to add an IP Endpoint to the pool. 
  
      .. figure:: ../_figures/26.png 

   4. Select the endpoint we’ve just created, as well as the monitor. Click **Add** and **Create**.   
  
      .. figure:: ../_figures/56.png 
  
   A newly created pool with the one NA endpoint will appear on the list.    

#. Add a Load Balanced Record

   After creating all the components (IP endpoint, Pool, Region and Monitor), we can create a DNS Load Balancer record and its     proximity rule. 

   1. Go to the **Load balanced records** tab and then click **Create**.

      .. figure:: ../_figures/118.png

   2. Fill in LBR name "auction", host "auction", select "A" as "Resource Record Type" and set a proximity rule ("Anywhere" -> "america" pool) to direct requests from anywhere to "america" pool with the created NA1 endpoint. Set score of the proximity rule to be "1". This will define the priority of the rule after some more are added.

      Click **Add Rule**, then check ***Enabled*** tick and **Save** the record.

      .. figure:: ../_figures/78.png

   3. Go back to the DNS Load Balancer tab, click on your service and activate it.

      .. figure:: ../_figures/119.png

   The DNS Load Balancer service is now setup.  

#. Test via Browser 

   Let’s test the created service with the proximity rule via browser.  

   1. Open FQDN ("auction.{{zone name}}" where {{zone name}} is the value copied from postman in one of the step above) in your browser.

      .. figure:: ../_figures/29.png 

   2. You will see that acc to the proximity rule, you joined the endpoint belonging to the "america" pool. 

      .. figure:: ../_figures/30.png 

#. Test via Command Prompt 

   Another way to test the new proximity rule is via **Command Prompt**.   

   1. Start **Command Prompt**.  

      .. figure:: ../_figures/70.png 

   2. Paste the following command to the **Command Prompt**: **nslookup "your FQDN name"** and press **Enter**.

      .. figure:: ../_figures/68.png 

   And you will see **34.229.48.248** IP in the response which belongs to **na1-auction** endpoint from **america** pool.  
  
Add Multiple Endpoints to Load Balanced Pool & Test
---------------------------------------------------

a. Add More Endpoints (NA2,3) 

   Let's now add a few more endpoints for load balancing of the application. Note that NA2 endpoint is deployed on Amazon AWS, whereas NA3 is running on Microsoft Azure. 

   1. Go back to the F5 Cloud Services portal, the **DNS Load Balancer** service, the **IP endpoints** tab and select **Create**. 
   
      .. figure:: ../_figures/92.png 
   
   2. Fill in name ("na2-auction"), IP address ("18.232.64.254"), port ("80") and select the monitor we created above.
   
      .. figure:: ../_figures/93.png 
   
      Create one more endpoint repeating the step above using the following properties: "na3-auction" for name, "13.82.106.211" for IP address, "80" for port. You will have three endpoints as a result. 
   
      .. figure:: ../_figures/94.png 
   
#. Add the Endpoints to the Pool

   Let's now add the newly created endpoints to the existing pool. 

   1. Go to the **Pools** tab and click on the **america** pool.
   
      .. figure:: ../_figures/95.png
   
   2. Click **Add Member** and select the endpoint to be added. 
   
      .. figure:: ../_figures/96.png
   
      Add one more endpoint and click **Save**. Now all three endpoints belong to one pool:
   
      .. figure:: ../_figures/97.png

#. Test via Default Browser

   Let’s test the updated pool with the new endpoints via browser.  

   1. Open FQDN ("auction.{{zone name}}" where {{zone name}} is the value copied from postman in one of the step above) in your browser.

      .. figure:: ../_figures/29.png 

   2. You will see that acc to the proximity rule and pool members, you will get to endpoints belonging to the **america** pool in a round-robin manner. 

      .. figure:: ../_figures/98.png
   
      And let's now update the page:
   
      .. figure:: ../_figures/99.png

Add Europe Region & EU Endpoint with Corresponding Geoproximity Record
----------------------------------------------------------------------

a. Add EU Endpoint

   Let's now add a EU endpoint which is deployed on Amazon AWS. 

   1. Go back to the F5 Cloud Services portal, the **DNS Load Balancer** service, the **IP endpoints** tab and select **Create**. 
   
      .. figure:: ../_figures/92.png 
   
   2. Fill in name ("eu-auction"), IP address ("3.122.191.227"), port ("80") and select the monitor we've created above.
   
      .. figure:: ../_figures/100.png 
   
      The new endpoint will appear on the list.

#. Add EU Region

   Creating EU region will allow grouping requests coming from the European region and directing them to a specific pool.   

   1. Go to the **Regions** tab and click **Create**.  
  
      .. figure:: ../_figures/300.png 

   2. Fill "europe" as "Region name" and select "Europe" in "Include these continents". Save the created region.  
  
      .. figure:: ../_figures/101.png 
   
   Now you have two regions created.

#. Add EU Pool

   Let's now create a pool and add a member to it. 

   1. Go to the **Pools** tab and then click **Create**. 
  
      .. figure:: ../_figures/122.png

   2. Fill in "europe" name, choose "round-robin" method and define TTL "30". Then click **Next**.  
  
      .. figure:: ../_figures/102.png 

   3. Click **Add Member** to add an IP Endpoint to the pool. 
  
      .. figure:: ../_figures/301.png 

   4. Select the endpoint we’ve just created, as well as the monitor. Click **Add** and **Create**.   
  
      .. figure:: ../_figures/302.png 
  
      A newly created pool with one EU endpoint will appear on the list.    

#. Update LB Record  Europe -> "europe"

   Now that we have created EU pool, region and endpoint, we can update load balanced record and add a new proximity rule: to send the traffic originating in Europe to the "europe" pool, utilizing a higher relative score than the previous rule of routing traffic from "Anywhere" to the "america" pool. This type of geo-proximity based routing is useful for GDPR compliance.  

   Go to the **Load balanced records** tab and click on your record. Set a new proximity rule ("europe" -> "europe" pool). Set the score of the proximity rule to be "50". 

   .. figure:: ../_figures/103.png

   Click **Add Rule** and **Save** the record. The new proximity rule will direct requests from Europe region to **europe** pool. 

#. Test using the Opera Browser 

   Now let’s test the new proximity rule. This can be done either via the Opera browser or via your computer’s **Command Prompt** (see the next section).  

   1. Open the Opera browser, copy FQDN name (“auction."your zone name"”) in **Load balanced record properties** and paste into your browser. You will get to one of three available IP endpoints of the “america” pool.

      .. figure:: ../_figures/50.png 

   2. Let’s now test the EU proximity rule. Click **VPN** and select **Europe**. This will simulate your entering BuyTime Website from Europe.

      .. figure:: ../_figures/8.png 

   3. Update your "auction."zone name"" page to see that acc to the proximity rule, you switched to the European pool. 

      .. figure:: ../_figures/9.png 

#. Test via Command Prompt 

   Another way to test the new proximity rule is via **Command Prompt**.   

   1. Start **Command Prompt**.  

      .. figure:: ../_figures/70.png 

   2. Paste the following command to the **Command Prompt**: "nslookup auction.cloudservicesdemo.net 198.6.100.25". 

      .. figure:: ../_figures/68.png 
   
      And you will see **34.229.48.248** IP in the response which belongs to **na1-auction** endpoint from **america** pool.  

   3. Now let’s check the **europe** pool. Paste the following command to the **Command Prompt**: **nslookup auction.cloudservicesdemo.net 158.43.240.3**. 

      .. figure:: ../_figures/71.png 

      And you will see **3.122.191.227** IP in the response which belongs to **eu-auction** endpoint from **europe** pool. 

Duplicate Load Balanced Record using JSON through the UI  
--------------------------------------------------------

Let's now duplicate a load balanced record and its configuration in the existing Load-balancing service via the F5 Cloud Services portal. To do that, follow the step below: 

a. Get JSON

   Go to the **DNS Load Balancer** tab in the portal and click on your existing Load-balancing service. Open the **JSON configuration** tab and copy it.  

   .. figure:: ../_figures/82.png 

#. Create New Load Balanced Service 

   Let's now create a new Load-balancing service via UI to copy the record to. To do that, you will first need to get “zone2”.  

   1. Go back to Postman and open **Get DNS Zone(lab)** request.  Copy "zone2" which is returned in its response.  

      .. figure:: ../_figures/84.png 

   2. Open any text editor (say, **Notepad**) and paste the **JSON configuration**. Replace the existing zone name with the "zone2" copied from the Postman in the step above:  

      .. figure:: ../_figures/83.png 

      A new JSON configuration with the properties copied from the existing zone is ready.  

   3. Return to the F5 Cloud Services portal and open the **DNS Load Balancer** tab. Click **Create**. 

      .. figure:: ../_figures/85.png 

      Paste "zone2" name which you copied in step 1 above and click **Create**.  

      .. figure:: ../_figures/86.png 


#. Update JSON 

   Уou have just created a new Load-balancing service. Let’s configure it by duplicating the Load balanced record from the existing service.  

   Click on your newly created service and open the **JSON configuration** tab. Paste the JSON which you created in step b) 2. above and click **Save**.    

   .. figure:: ../_figures/87.png 

   Go back to the newly created Load-balancing service to see the newly created record which is the copy of the original one.  

#. Go back to the DNS Load Balancer tab and activate the new DNS Load Balancer service by selecting **Activate** button:

   .. figure:: ../_figures/104.png

   Status will be updated a few seconds later.

#. Test via Browser

   1. Open FQDN ("auction.{{zone-2 name}}" where {{zone-2 name}} is the value copied from postman in one of the step above) in your browser.

      .. figure:: ../_figures/123.png

   2. You will see that acc to the proximity rule and pool members, you will get to endpoints belonging to the **closest** pool in a round-robin manner.

      .. figure:: ../_figures/106.png
   
Delete DNS Load Balancer Service
--------------------------------

#. Go back to the F5 Cloud Services portal, the **DNS Load Balancer** tab, and click on your load-balancing service.  
   
   .. figure:: ../_figures/107.png
   
#. Tick the records and click **Delete**, then confirm your choice.
   
   .. figure:: ../_figures/108.png
