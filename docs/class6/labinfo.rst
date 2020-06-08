Lab Environment Overview
========================

APIs and Services 
-----------------

This Lab utilizes standard *F5 Cloud Services API*, as well as a *Lab Service API*, which was custom-built just for executing this lab: 

* **F5 Cloud Services API**: create, use, and remove the services in the scope of this lab 

* **Lab service API**: facilitates auxiliary functions for the lab only: creating DNS entries, sending targeted requests & traffic to the apps/services, etc.  

The following diagram captures the core components of this Lab: 

.. figure:: _figures/Diagram.png
     
Application Scenario 
--------------------

In order to fully explore the capabilities of F5 Cloud Services, you will be able to use an existing application with a set of live instances across different clouds and geographic locations. This app is `"BuyTime Auction" <http://bit.ly/37fVwfX>`_, a fictitious multi-instance deployment that helps to simulate a globally deployed app topology. Unsurprisingly, performance, global availability, zero downtime, 
and security are critical for this application, while the app Developers & DevOps are used to consuming app infrastructure as-a-Service.  

The following are the demo application instances, some of which will be utilized in the scope of this lab:

.. csv-table::    
   :header: "Name", "Geography", "Cloud/Region", "IP", "URI"

   "NA1", "North America", "AWS - US East (N. Virginia)", "34.229.48.248", "http://na1-auction.cloudservicesdemo.net/"
   "NA2", "North America", "AWS – US East (N. Virginia)", "18.232.64.254", "http://na2-auction.cloudservicesdemo.net/"
   "NA3", "North America", "Azure – US East", "13.82.106.211", "http://na3-auction.cloudservicesdemo.net/"
   "EU", "Europe", "AWS – Europe (Frankfurt)", "3.122.191.227", "http://eu-auction.cloudservicesdemo.net/"

The following diagram is a simplified architecture of the Auction application: 
 
.. figure:: _figures/Auction.png
