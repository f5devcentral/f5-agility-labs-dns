F5 DNS Cloud Service - API
==========================

In this section we will repeat the flow of the preceding section by using the F5 Cloud Services APIs with the help of Postman.

1. Create Zone
--------------

In order to create your zone using API, you will first need to get your account details - membership and catalogs. 

`a)` Get User Membership to F5 Cloud Services accounts 

In Postman, send the **Get User Membership** request which returns info on your user’s access to Cloud Services accounts. 

..figure:: ../_figures/89.jpg 

You will see account ids, names, roles and other information in the body of response. 

..figure:: ../_figures/29.jpg 

Your "account_id" will be retrieved using "account_name" and used for creating user's instances. 

..figure:: ../_figures/28.jpg 

More detailed information on this API request can be found here `List user memberships <http://bit.ly/2Gfu1r3>`_. 

`b)` Retrieve information on available catalogs and their IDs

Select the **Get Catalogs** request and click **Send** to retrieve data about the available Catalogs and their IDs. 

..figure:: ../_figures/90.jpg 

As you see there are a number of catalogs available: 

..figure:: ../_figures/31.jpg 

The retrieved IDs are then stored for subsequent calls using a function inside Postman to set environment variables. You can see the test function in the **Tests** tab: 

..figure:: ../_figures/30.jpg 

More detailed information on this API request can be found here `List services in the catalog <http://bit.ly/36j1Yl4>`_.  

`c)` Select the **Create DNS Subscription** request and click **Send** to create a new service instance of Secondary Authoritative DNS using “account_id” and “catalog_id” retrieved a few steps above.  

..figure:: ../_figures/93.jpg 

You will see “subscription_id” and created “service_instance_id” in the body.   

..figure:: ../_figures/41.jpg
 
The retrieved "subscription_id" is then stored for subsequent calls.
 
..figure:: ../_figures/40.jpg

You can change its status from “DISABLED” to “ACTIVE” sending the **Activate DNS Subscription** request below. 
More detailed information on this API request can be found here `Create a subscription <http://bit.ly/36fvHLX>`_.

`d)` Select the **Activate DNS Subscription** request and click **Send**. This will deploy the secondary DNS using “subscription_id” captured in one of the steps above.  

..figure:: ../_figures/42.jpg

You will see “active” subscription status.  

..figure:: ../_figures/43.jpg

Note that it takes some time to deploy the service, so you can just re-send the same request after a few minutes to see “service_state”: “DEPLOYED”.  

..figure:: ../_figures/44.jpg

More detailed information on this API request can be found here `Activate a subscription <http://bit.ly/36h6tgj>`_.

2. Get Zone File
----------------

Send the **Get DNS Subscription Zones** request which uses DNS “subscription_id” created a few steps above.  This will retrieve a zone file from your primary DNS server.  

..figure:: ../_figures/94.jpg

As a result, you will get the zone file describing your DNS zone and containing mappings between domain names and IP addresses.  

..figure:: ../_figures/88.png

3. Query via Browser
--------------------

Let's now check the created DNS service via browser. 

`a)` Copy NA1 address from the Zone file retrieved in the step above:

..figure:: ../_figures/89.png

`b)` Paste the copied address into your browser and you will get to the created secondary DNS instance: 

..figure:: ../_figures/90.png

4. Review the JSON 
------------------

Let's now see the structure of the JSON. In order to get the JSON, go back to Postman and send the **Get DNS JSON** request which uses your ACCESS_TOKEN to retrieve the JSON:

..figure:: ../_figures/109.png

The response will retrieve the JSON containing all the DNS instance information: 

..figure:: ../_figures/110.png

As you can see, the JSON provides some general information on subcription_id, user_id, and instance name, as well as all configuration details (service IP, zone name, etc). 

5. Delete Zone
--------------

In order to delete your Zone using Postman, send the **Retire DNS Subscription** request which uses the relevant “subscription_id”.  

..figure:: ../_figures/79.jpg 

You will see “retired” status in the response body which means that it’s not available on the F5 Cloud Services portal anymore.

..figure:: ../_figures/80.jpg

More detailed information on these API requests can be found `here <http://bit.ly/2Gf166I>`_. 
