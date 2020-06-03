F5 DNS Load Balancer Cloud Service - API
========================================

1. Create DNS Load Balancer Subscription
----------------------------------------

Select the **Create GSLB Subscription** request and click **Send** to create a new service instance of DNS Load Balancer using “account_id” and “catalog_id” retrieved a few steps above.

.. figure:: _figures/95.jpg 

You will see “subscription_id” and created ”service_instance_id” in the body. You may also note that this request will create only NA1 endpoint for now. Some more will be created in the subsequent requests. 

You may also notice that the current proximity rule is set to send traffic from: Everyone -> Americas pool. This means that only one endpoint (NA1) will be serving all requests now. We will subsequently configure proper load balancing and geoproximity rules. 

.. figure:: _figures/48.jpg 

The retrieved "subscription_id" is then stored for subsequent calls. 

.. figure:: _figures/47.jpg 

You can change its status from "DISABLED” to “ACTIVE” sending the **Activate GSLB Subscription** request below.

More detailed information on this API request can be found here `Create a subscription <http://bit.ly/36fvHLX>`_.  

2. Activate DNS Load Balancer Subscription
------------------------------------------

Select the **Activate GSLB Subscription** request and click **Send**. This will deploy DNS Load Balancer using “subscription_id” captured in one of the steps above.

.. figure:: _figures/49.jpg 

You will see “active” subscription status. 

.. figure:: _figures/50.jpg 

More detailed information on this API request can be found here `Activate a subscription <http://bit.ly/36h6tgj>`_. 

3. Test NA Pool
---------------

Send the **Test NA Availability (lab)** request to execute a call against the Lab service API, which in turn uses an external VM (located in the USA) to run a "wget" to retrieve the response from http://auction.cloudservicesdemo.net. This should show the only available instance NA1 in the HTML that is returned. 

.. figure:: _figures/52.jpg 

The response shows that your first instance is available: 

.. figure:: _figures/53.jpg 

4. Add Endpoints & Pool Members
-------------------------------

Send the **Add Endpoint & Pool Members** request to add a few more endpoints for load balancing of the application. Note that three of the new endpoints (EU and NA2) are deployed on Amazon AWS, and one (NA3) is running on Microsoft Azure. NA1, NA2, and NA3 endpoints are aggregated into a pool "usa", which demonstrates multi-cloud load balancing. 

.. figure:: _figures/54.jpg 

You will see all the information on the added endpoints: 

.. figure:: _figures/55.jpg 

5. Test Round Robin
-------------------

Run the **Test Round Robin** request to check the response from the Lab service API to test what instance is now being returned. This should show a result different from the previous due to the newly-configured round-robin load balancing. 

.. note:: it's possible that you will still get the same endpoint in the response due to either DNS caching or 1/3 chance of the same endpoint to be pulled from the load-balance pool. Let's try: 

.. figure:: _figures/56.jpg 

And check the response: 

.. figure:: _figures/57.jpg 

You can send the same request to check other instances. 

6. Update Proximity Rule
------------------------

Run the **Update Proximity Rules & Regions**. This adds a new region "europe", and assigns a EU endpoint to it. It also updates the DNS Load Balancer with new proximity rules: to send the traffic originating in Europe to the "europe" pool, utilizing a higher relative score than the previous rule of routing traffic from "Anywhere" to the "usa" pool. This type of geo-proximity based routing is useful for GDPR compliance. 

.. figure:: _figures/58.jpg 

And you will see all the information on available pools and regions: 

.. figure:: _figures/76.png 

7. Test Proximity Rules
-----------------------

Send the **Test Proximity Rules** request, which uses an external VM (located in Europe) to run a "wget" to retrieve the response from http://auction.cloudservicesdemo.net. This simulates what an EU-based customer would see when opening this URL in their browser. NOTE: you can also test this in your Opera browser (using EU proxy), the way you've done it previously with the UI. 

.. figure:: _figures/60.jpg 

Here’s what you should see in the response: 

.. figure:: _figures/61.jpg 

8. Review the JSON 
------------------

Let's now see the structure of the JSON. In order to get the JSON, send the **Get GSLB JSON** request which uses your ACCESS_TOKEN to retrieve the JSON:

.. figure:: _figures/111.png

The response will retrieve the JSON containing all the DNS Load Balancer instance information: 

.. figure:: _figures/112.png

As you can see, the JSON provides some general information on subcription_id, user_id, and instance name, as well as all configuration details. The configuration section "details" includes information on "pools_health": 

.. figure:: _figures/116.png

The next configuration section is "gslb_service" which contains "load_balanced_records" with their "name" and "proximity_rules": 

.. figure:: _figures/117.png

It also includes "pools" section with their "name", "load_balancing_mode" and "members": 

.. figure:: _figures/115.png

One more section is "regions" which includes information on region "names" and "sectors": 

.. figure:: _figures/114.png

And another section provides information on "virtual_servers": their IP endpoints, addresses, names, monitors and ports: 

.. figure:: _figures/113.png

9. Delete DNS Load Balancer Service
-----------------------------------

Send the **Retire GSLB Subscription** request which uses the relevant “subscription_id”.

.. figure:: _figures/81.jpg

You will see “retired” status in the response body which means that it’s not available on the F5 Cloud Services portal anymore.

.. figure:: _figures/80.jpg
