############################################
GSLB
############################################

  Students will configure an F5 DNS server to support GSLB services on a single device in site1, and subsequently join an additional F5 DNS server in site2 to the GSLB cluster. A Windows AD DNS server is authoritative for the zone example.com and contains a static A record for "www.example.com", which resolves to 203.0.113.9. Students will add glue records and delegate gslb.example.com to the F5 GSLB DNS servers, and convert the A record "www.example.com" to be a CNAME record pointing
  to "www.gslb.example.com". At the end of the lab students will observe that the F5 GSLB DNS servers will alternately resolve www.example.com to 203.0.113.9 and 198.51.100.41. 
  
Orientation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Open the command prompt on the Windows jumpbox execute the command:

   **dig www.example.com**. Examine the output, and notice that an A record exists.

   .. figure:: ./images/dig_www.example.com_static.png

#. Open Internet Explorer and access `www.example.com <https://www.example.com>`__. Note that you accessed a web server in site1.
   
   **TODO - Create content server page and add screenshot**


#. RDP to the domain controller using: **EXAMPLE\\user**, password **Agility1**.
   
   **Start** –> **Remote Desktop Connection** –> **10.1.70.200**.
   
#. Click on **Server Manager**, and in the top right corner choose **Tools** and then **DNS**

   .. figure:: ./images/AD_tools.png

#. Double click on **EXAMPLE.COM** and examine DNS records

   .. figure:: ./images/DNS_Manager.png

   .. figure:: ./images/www_properties.png


#. Connect to https://bigip1.site1.example.com and examine configuration of the virtual server
       (**203.0.113.9**) and corresponding pool

#. Connect to https://bigip1.site2.example.com and examine the virtual servers. List the virtual servers
       (**198.51.100.41**)

Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  You are going to configure DNS query and response logging. To do
       this, you must tell GTM where to send logs to (a log publisher)
       and what specifically to log (DNS logging profile).

-  For lab purposes, we are going to use local-syslog as our logging
       destination. *Note that remote high speed logging is the
       recommendation for production environments.*

#. Open Internet Explorer and login to https://gtm1.site1.example.com https://10.1.10.13

#. In the GUI, navigate to: **DNS > Delivery > Profiles > Other > DNS Logging: Create**

#. Create a new DNS logging profile as shown in the table below. Keep
       the defaults if not noted in the table.

+------------------------+----------------------------------+
| **Name**               | example\_dns\_logging\_profile   |
+========================+==================================+
| **Log Publisher**      | Select sys-db-access-publisher   |
+------------------------+----------------------------------+
| **Log Responses**      | Enabled                          |
+------------------------+----------------------------------+
| **Include Query ID**   | Enabled                          |
+------------------------+----------------------------------+
|                        | Click Finished                   |
+------------------------+----------------------------------+

-  Your new dns-logging profile should now have all options enabled.

DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  A DNS profile tells the DNS Listener how to process DNS traffic.
       We’re going to make some basic tweaks.

-  In the GUI, navigate to: **DNS > Delivery > Profiles > DNS: Create**

-  Create a new DNS profile as shown in the following table. Keep the
       defaults if not noted in the table.

+----------------------------------+----------------------------------+
| **Name**                         | example.com\_dns\_profile        |
+==================================+==================================+
| **Unhandled Query Action**       | Drop                             |
+----------------------------------+----------------------------------+
| **Use BIND Server on Big-IP**    | Disabled                         |
+----------------------------------+----------------------------------+
| **Logging**                      | Enabled                          |
+----------------------------------+----------------------------------+
| **Logging Profile**              | example\_dns\_logging\_profile   |
+----------------------------------+----------------------------------+
| **AVR statistics Sample Rate**   | Enabled, 1/1 queries sampled     |
+----------------------------------+----------------------------------+
|                                  | Click Finished                   |
+----------------------------------+----------------------------------+

Listener
~~~~~~~~~~~~~~~~~~~~~~~~~~

We are going to create UDP/TCP external Listeners. You will use this IP
as a target address when querying GTM.

In the GUI, navigate to: **DNS > Delivery > Listeners > Listener List:
Create**

-  Create two external Listeners as shown in the tables below. Keep the
       defaults if not noted in the table.

+---------------------------------+--------------------------------------------------+
| **Name**                        | isp2\_site1\_ns1.example.com\_udp\_53\_virtual   |
+=================================+==================================================+
| **Destination**                 | Host: 203.0.113.8                                |
+---------------------------------+--------------------------------------------------+
| **Protocol Profile (Client)**   | example.com\_dns\_profile                        |
+---------------------------------+--------------------------------------------------+
| **DNS Profile**                 | example.com\_dns\_profile                        |
+---------------------------------+--------------------------------------------------+
|                                 | Click Finished                                   |
+---------------------------------+--------------------------------------------------+

Data Centers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  In the GUI, navigate to: **DNS > GSLB > Data Centers > Data Center List: Create**

-  Create two Data Centers as shown below. Leave all defaults unless
       otherwise noted:

+------------+---------------------+
| **Name**   | site1\_datacenter   |
+============+=====================+
|            | Click Finished      |
+------------+---------------------+

+------------+---------------------+
| **Name**   | site2\_datacenter   |
+============+=====================+
|            | Click Finished      |
+------------+---------------------+

-  Your Data Center list should look like the diagram below. Why is the
       status blue?

   |image3|

Server Object
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, GTM is not self-aware. You will need to configure your BigIP
as a server object.

-  In the GUI, navigate to: **DNS > GSLB > Servers > Server List: Create**

-  Create a Server Object as defined in the table and diagram below.
       Leave default values unless otherwise noted:

+--------------------------------+-------------------------------------------------------+
| **Name**                       | site1-gtm                                             |
+================================+=======================================================+
| **Data Center**                | site1\_datacenter                                     |
+--------------------------------+-------------------------------------------------------+
| **Devices**                    | Click add and specify 203.0.113.7; click add and OK   |
+--------------------------------+-------------------------------------------------------+
| **Health Monitors**            | BIGIP                                                 |
+--------------------------------+-------------------------------------------------------+
| **Virtual Server Discovery**   | Disabled                                              |
+--------------------------------+-------------------------------------------------------+
|                                | Click Finished                                        |
+--------------------------------+-------------------------------------------------------+

|image4|

-  Click on the “Server List” tab at the top menu bar to refresh the
   page. You should see the Server object as green.

   | |image5|
   | What is the status of the site1\_datacenter object now?

Students will be using an LTM objects to on both site1 and site2
datacenters. You will need to create another BigIP objects to do this.
Prior to configuring the Server object, we need to establish trust
between the GTM and LTM. The bigip\_add script will exchange device
certificates to establish a trust relationship.

-  Login via SSH using putty to your gtm1.site1 (10.1.10.13) using
   username: **root** password: **default**

-  | Issue the following commands:
   | **bigip\_add 203.0.113.5**

   Type ‘\ **yes**\ ’ to proceed and enter ‘\ **default** as the
   password.

   | Now type:
   | **big3d\_install 203.0.113.5**

   Note that this script likely won’t need to install a new version of
   the big3d agent… this is just for you to be familiar with the script.

   Repeat same operations (bigip\_add and big3d\_install) for the
   following LTM objects: 203.0.113.6, 198.51.100.37, 198.51.100.38

-  From the gtm1.site1 GUI, navigate to: **DNS > GSLB > Servers> Server List: Create**

-  Create a Server Object as defined in the tables and diagram below.
       Leave default values unless otherwise noted:

+--------------------------------+-----------------------------------------------+
| **Name**                       | site1\_ha\_pair                               |
+================================+===============================================+
| **Product**                    | BIG-IP System                                 |
+--------------------------------+-----------------------------------------------+
| **Data Center**                | site1.datacenter                              |
+--------------------------------+-----------------------------------------------+
| **Devices**                    | Click add and specify                         |
|                                |                                               |
|                                | Name: bigip1.site1                            |
|                                |                                               |
|                                | Address: 203.0.113.5; click add and then OK   |
|                                |                                               |
|                                | Click add and specify                         |
|                                |                                               |
|                                | Name: bigip2.site1                            |
|                                |                                               |
|                                | Address: 203.0.113.6; click add and then OK   |
+--------------------------------+-----------------------------------------------+
| **Health Monitors**            | bigip                                         |
+--------------------------------+-----------------------------------------------+
| **Virtual Server Discovery**   | Enabled                                       |
+--------------------------------+-----------------------------------------------+
|                                | Click Finished                                |
+--------------------------------+-----------------------------------------------+

|image6|

-  After a few moments, click on the “Server List” tab at the top menu
       bar to refresh the page. You should see the Server object as
       green and number of discovered virtual servers. Below is a sample
       of what your screen should look like:

   |image7|

-  Create server objects for site2.datacenters based on the tabled below

+--------------------------------+-------------------------------------------------+
| **Name**                       | site2\_ha\_pair                                 |
+================================+=================================================+
| **Product**                    | BIG-IP System                                   |
+--------------------------------+-------------------------------------------------+
| **Data Center**                | site2.datacenter                                |
+--------------------------------+-------------------------------------------------+
| **Devices**                    | Click add and specify                           |
|                                |                                                 |
|                                | Name: bigip1.site2                              |
|                                |                                                 |
|                                | Address: 198.51.100.37; click add and then OK   |
|                                |                                                 |
|                                | Click add and specify                           |
|                                |                                                 |
|                                | Name: bigip2.site2                              |
|                                |                                                 |
|                                | Address: 198.51.100.38; click add and then OK   |
+--------------------------------+-------------------------------------------------+
| **Health Monitors**            | bigip                                           |
+--------------------------------+-------------------------------------------------+
| **Virtual Server Discovery**   | Enabled                                         |
+--------------------------------+-------------------------------------------------+
|                                | Click Finished                                  |
+--------------------------------+-------------------------------------------------+

-  Go to your SSH session on GTM1 and take a look at the /var/log/gtm
   file to see what kinds of logs are generated after a server is
   created.
   **tail -100 /var/log/gtm**

Generic Host
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GTM can handle virtual servers that do not reside on a BigIP. The most
common way of incorporating non-F5 virtual server is using a Server type
of Generic Host.

-  In the GUI, navigate to: **DNS > GSLB > Servers > Server List: Create**

-  Create a Server Objects as defined in the table below. Note that the
       web virtual server is manually configured here and happens to be
       the same IP address as the physical host.

+-----------------------------------+--------------------------+
| **Name**                          | lamp1.site1              |
+===================================+==========================+
| **Product**                       | Generic Host             |
+-----------------------------------+--------------------------+
| **Address**                       | 203.0.113.15 (tap Add)   |
+-----------------------------------+--------------------------+
| **Data Center**                   | site1\_datacenter        |
+-----------------------------------+--------------------------+
| **Health Monitors**               | Gateway\_icmp            |
+-----------------------------------+--------------------------+
| **Virtual Server List Name**      | lamp1.site1              |
+-----------------------------------+--------------------------+
| **Virtual Server List Address**   | 203.0.113.15 (tap Add)   |
+-----------------------------------+--------------------------+
| **Service Port**                  | 80                       |
+-----------------------------------+--------------------------+
|                                   | Click Finished           |
+-----------------------------------+--------------------------+

+-----------------------------------+---------------------------+
| **Name**                          | lamp1.site2               |
+===================================+===========================+
| **Product**                       | Generic Host              |
+-----------------------------------+---------------------------+
| **Address**                       | 198.51.100.47 (tap Add)   |
+-----------------------------------+---------------------------+
| **Data Center**                   | site2\_datacenter         |
+-----------------------------------+---------------------------+
| **Health Monitors**               | Gateway\_icmp             |
+-----------------------------------+---------------------------+
| **Virtual Server List Name**      | lamp2.site1               |
+-----------------------------------+---------------------------+
| **Virtual Server List Address**   | 198.51.100.47 (tap Add)   |
+-----------------------------------+---------------------------+
| **Service Port**                  | 80                        |
+-----------------------------------+---------------------------+
|                                   | Click Finished            |
+-----------------------------------+---------------------------+

|image8|

|image9|

-  Make sure all server objects are available

   |image10|

   STOP – You have completed lab 1

Exercise 2.1 – GSLB Active/Standby Data Centers
===============================================

-  In this use-case, you will complete GSLB configuration for a disaster
   recovery scenario. In this case, site1 will always be preferred while
   site2 is only used if East is down.

-  Estimated completion time: 10 minutes

TASK 1 – Create a GTM Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~

-  From the gtm1.site1 GUI, navigate to: **DNS > GSLB > Pools > Pool List: Create**
-  Create a new Pool as shown in the table and
   diagram below. Keep the defaults if not noted in the table.

+-----------------------------+-----------------------------------------------------------------------+
| **Name**                    | www\_https\_pool                                                      |
+=============================+=======================================================================+
| **Type**                    | A                                                                     |
+-----------------------------+-----------------------------------------------------------------------+
| **Load Balancing Method**   | Preferred: Global Availability                                        |
+-----------------------------+-----------------------------------------------------------------------+
| **Virtual Servers**         | isp1\_site1\_www.example.com\_tcp\_https\_virtual 203.0.113.9:443     |
|                             |                                                                       |
|                             | ips2\_site2\_www.example.com\_tcp\_https\_virtual 198.51.100.41:443   |
+-----------------------------+-----------------------------------------------------------------------+

Make sure that the east VS is at the top of the Member List as shown
below. This is an ordered failover from top to bottom.

|image11|

Click Finished

TASK 2 – Create a WideIP
~~~~~~~~~~~~~~~~~~~~~~~~

We will create a hostname to use as a Wide IP.

-  In the GUI, navigate to: **DNS > GSLB > Wide IPs > Wide IP List: Create**
-  Create a new Wide IP as shown in the table below. Keep
       the defaults if not noted in the table.

+-------------------------+----------------------------------------------------------------+
| **Name**                | www.example.com                                                |
+=========================+================================================================+
| **Type**                | A                                                              |
+-------------------------+----------------------------------------------------------------+
| **Alias**               | `www.gslb.example.com <http://www.gslb.example.com>`__ (Add)   |
+-------------------------+----------------------------------------------------------------+
| **Pools – Pool List**   | www\_https\_pool (Add)                                         |
+-------------------------+----------------------------------------------------------------+

Click Finished

-  Open a Command Prompt window on your Windows jump box and query your
       Listener for the Wide IP. You may wish to issue this command
       several times:

   **dig www.gslb.example.com @203.0.113.98**

   Your results should look like the following example:

   |image12|

   Try hitting `**https://www.example.com** <https://www.example.com>`__
   in a browser. Does the page open? Why?

   | Now is a good time to view query logging. In the SSH shell on the
     **gtm1**, view the logs in /var/log/ltm:
   | **tail –f /var/log/ltm**

   Can you see DNS query logs originated from CLI? From the Web-browser?

TASK 3 – Configure zone delegation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Open RDP and connect to domain controller at **10.1.70.20**
       (EXAMPLE\\user; Agility1). Open DNS Manager.

-  We are going to replace A record for
       `www.example.com <http://www.example.com>`__ with CNAME record
       `www.gslb.example.com <http://www.gslb.example.com>`__. This will
       enable local resolution by AD and dynamic scaling for
       `www.example.com <http://www.example.com>`__ application

-  Delete exisiting A record for
       `www.example.com <http://www.example.com>`__

   |image13|

-  Click on the menu Action – New Alias (CNAME). Confgure according to
       the table

+---------------------------------------------------+------------------------+
| **Alias Name**                                    | www                    |
+===================================================+========================+
| **Fully Qualified Domain Name (FQDN)**            | www.EXAMPLE.COM        |
+---------------------------------------------------+------------------------+
| **Fully Qualified Domain Name for target host**   | www.gslb.example.com   |
+---------------------------------------------------+------------------------+

Click OK

-  Click on the menu Action – New Delegation - Next. In the “Delegeted
       domain” specify “gslb” and clock Next. Tap Add and in the form
       Server fully qualified domain name (FQDN) define ns1.EXAMPLE.com.
       Tap OK

   |image14|

-  Tap Next and Finish

-  Run the command on Windows Jumpbox:

   **dig www.example.com**

   The output should look like below.

   Hit the command multiple times. Are you getting the same response?
   Why?

   |image15|

-  Open web-browser and try to connect to
       `www.example.com <http://www.example.com>`__. Try refreshing the
       web page multiple times.

-  | Now we are going to disable the site1.datacenter. Before we do
     this, open an SSH session to your GTM1 and tail the log file:
   | **tail –f /var/log/gtm**

-  While the log is updating, navigate in the **gtm1** to **DNS > GSLB >
   Pools > Pools List.** Tap on www\_https\_pool and choose “members”.
   Set checkbox for site1\_ha\_pair and tap Disable

   |image16|

-  | Query the WideIP again from the Command Prompt and note the
     results. The site2.datacenter server IP should be returned. 
   | **dig www.example.com**

-  You can also try refreshing the web page from a browser – you should
   be directed to the applicatiom hosted in site2.datacenter (green
   headline)

-  Now go back and re-enable site1\_ha\_pair pool memeber. Note the log
   messages in /var/log/gtm.

-  Query the WideIP again and note your results. Did it fail back?

TASK 4 – Configure Fallback 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will create a scenario for a fallback option when both east and west
Virtual Servers are unavailable.

-  In the gtm1 GUI, navigate to : **DNS > GSLB > Pools > Pool List.**
   Select the pool **www\_https\_pool**. Select the **Members** tab in
   the middle menu bar. Make the following changes as noted in the
   table.

+------------------------------+------------------------------------+
| **Load Balancing Method**    | | Preferred: Global Availability   |
|                              | | Alternate: None                  |
|                              |                                    |
|                              | Fallback: Fallback IP              |
+==============================+====================================+
| **Fallback IPv4**            | 1.1.1.1                            |
+------------------------------+------------------------------------+

-  Click **Update**

-  | Now highlight both members in the checkboxes to the left and click
     **Disable**. Your GUI should look similar to the following diagram:
   | |image17|

-  | In the Command Prompt window, query the WideIP again and note the
     results. They should look similar to below and show fallback:
   | **dig `www.example.com <http://www.example.com>`__**

   |image18|

   1. Fallback IP address which can be a sorry server for maintenance

-  Return to the GTM1 GUI go to **Statistics > Module Statistics > DNS >
   GSLB.** Under ‘Statistics Type’, select **Pools.** You should see
   statistics for Preferred, Alternate, and Fallback algorithms. You
   should see Fallback statistics updated

-  Go back and re-enable your pool members.

TASK 5 – Load balancing across pools 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  From the gtm1.site1 GUI, navigate to: **DNS > GSLB > Pools > Pool List: Create.**
       Create a new Pool as shown in the table and
       diagram below. Keep the defaults if not noted in the table.

+-----------------------------+-----------------------------------+
| **Name**                    | www\_https\_pool\_generic\_host   |
+=============================+===================================+
| **Type**                    | A                                 |
+-----------------------------+-----------------------------------+
| **Load Balancing Method**   | Preferred: Round Robin            |
+-----------------------------+-----------------------------------+
| **Virtual Servers**         | lamp1\_site1 203.0.113.15:80      |
|                             |                                   |
|                             | lamp1\_site2 198.51.100.47:80     |
+-----------------------------+-----------------------------------+

-  Tap Finished

-  Make sure that the east VS is at the top of the Member List as shown
   below. This is an ordered failover from top to bottom.

-  From the gtm1 GUI, navigate to: **DNS > GSLB > Wide IPs > Wide IP
   List.** Select ***www.example.com***. Select **Pools** from the
   middle menu bar. Tap Manage, choose
   **www\_https\_pool\_generic\_host** from dropdown menu and tap Add

   |image19|

-  Tap Finished

-  Change Load Balancing Method to Global Availability

-  Tap Update

-  In the gtm1 GUI, navigate to : **DNS > GSLB > Pools > Pool List.**
   Select the pool **www\_https\_pool**. Select the **Members** tab in
   the middle menu bar. Highlight both members in the checkboxes to the
   left and click **Disable**.

-  In the Command Prompt window, query the WideIP a few again and note
   the results

   **dig `www.example.com <http://www.example.com>`__**

-  Why you are getting 1.1.1.1 response sometimes?

-  What is the best way to fix it?

-  Try to fix it, query the WideIP again and make sure 1.1.1.1 response
   is not coming

-  Re-enable pool memebers in pool www\_https\_pool and deassociate pool
   www\_https\_pool\_generic\_host from WideIP

Exercise 2.2 – GSLB Active/Active Data Centers
==============================================

-  In this use-case, you will configure a WideIP that sends clients to
   both site1 and site2 Data Centers. This will involve scenarios with
   and without persistence.

-  Estimated completion time: 15 minutes

TASK 1 – Configure Active/Active traffic distribution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  In the GUI on your GTM, navigate to: **DNS > GSLB > Pools > Pool List > www\_https\_pool > Members.**
       Set preferred Load Balancing
       method to Round Robin and click Update

-  From Command Prompt on your Windows machine, query your Listener for
       the Wide IP. You may wish to issue this command several times:

   **dig `www.gslb.example.com <http://www.gslb.example.com>`__@203.0.113.8**

   You should see the site1 and site2 IPs returned in a round robin
   fashion - sometimes 2 in a row for each due to the multiple instances
   of TMM running on the virtual appliance.

   You can also see the results in a browser by going to
   `**http://example.com** <http://rr.webapp1.com>`__

   Refresh the page several times and you should see the round robin
   behavior in the browser.

-  Your results should have round robin of answers going between site1
   and site2 Virtual Servers.

-  | From GTM1 GUI to **Statistics > Module Statistics > DNS > GSLB.**
     Under ‘Statistics Type’, select **Pools.** Click on **View** under
     the ‘Members’ column for **www\_https\_pool**. You should see an
     even distribution between members similar to the diagram below:
   | |image20|

TASK 2 – Adding Persistence
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Many applications require session persistence. As a result, GTM needs to
send clients to the same Data Center via GSLB-level persistence.

-  From the gtm1 GUI, navigate to: **DNS > GSLB > Wide IPs > Wide IP
   List.** Select ***gslb.example.com***. Select **Pools** from the
   middle menu bar. Make the following changes

-  Enable Persistence

-  Change the Persistence TTL to 30 seconds

-  Click Update

   |image21|

-  From Command Prompt, query the WideIP ***www.gslb.example.com***
   several times and note the results. Do you see the same response each
   time?

-  In the GUI, navigate to: **Statistics > Module Statistics > DNS >
   GSLB.** Under ‘Statistics Type’, select **Persistence Records.** Note
   that because the Persistence TTL is only 30 seconds, you may need to
   send another query to generate a record. After 30 seconds expires,
   you should note the record disappearing.

-  **\*\*NOTE:** As of v12, persistence record statistics and logging is
   disabled. If you get the error message in the GUI, follow the
   directions and run the following from the CLI on GTM1. This will
   change the DB variable to allow you to view the persistence records
   in the GUI:

   **tmsh**

   **modify sys db
   ui.statistics.modulestatistics.dnsgslb.persistencerecords value
   true**

-  | Query the Wide IP again and then refresh the persistence record
     screen in the GUI
   | |image22|

Exercise 2.3 – GSLB with Topology
=================================

-  In this use-case, you will send clients to a preferred geographic
   location using Topology. We are also going to incorporate the use of
   multiple pools in this lab to introduce WideIP-level load balancing.

-  Estimated completion time: 10 minutes

TASK 1 – Create Topology Records
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will create topology records to define source IPs that will prefer
either www\_https\_pool or generic hosts pool. We are going to have your
workstation prefer www\_https\_ pool pool, while bigip1.site1 host will
prefer www\_https\_pool\_generic hosts.

-  In the GUI, navigate to: **DNS > GSLB > Topology > Records: Create.**
       Create two new records as shown in the tables below:

   **Topology Record 1**

+---------------------------------------+-------------------------------+
| **Request Source**                    | IP Subnet is 203.0.113.1/32   |
+=======================================+===============================+
| **Destination - Pools – Pool List**   | www\_https\_pool              |
+---------------------------------------+-------------------------------+
| **Weight**                            | 100                           |
+---------------------------------------+-------------------------------+

**Topology Record 2**

+---------------------------------------+------------------------------------+
| **Request Source**                    | IP Subnet is 203.0.113.5/32        |
+=======================================+====================================+
| **Destination - Pools – Pool List**   | www\_https\_pool\_generic\_hosts   |
+---------------------------------------+------------------------------------+
| **Weight**                            | 100                                |
+---------------------------------------+------------------------------------+

|image23|

TASK 3 – Configure WideIP
~~~~~~~~~~~~~~~~~~~~~~~~~

We will modify Wide IP configuration to use topology records

-  From the GTM1 GUI, navigate to: **DNS > GSLB > Wide IPs > Wide IP
   List > www.example.com.** Select **Pools** from the middle menu bar.
   Change Load Balancing methog to Topology and tap Update

-  Tap Manage, choose **www\_https\_pool\_generic\_host** from dropdown
   menu and tap Add.

   |image24|

-  Issue the following DNS query multiple times from a command prompt on
   your Windows workstation:

   **dig `www.gslb.example.com <http://www.gslb.example.com>`__
   @203.0.113.8**

   You should see the IP addresses from web\_https\_pool because you are
   coming from 203.0.113.1 which falls under Topology Record #1 that you
   created above.

-  Open an SSH session to the bigip1.site1 if you don’t have one open
   already.

   **dig `www.gslb.example.com <http://www.gslb.example.com>`__
   @203.0.113.8**

   You should see the IP address for the generic web server in the
   www-\_https\_pool\_generic\_host center returned.

   |image25|

Exercise 3.1 – Creating a Synchronization Group
===============================================

-  In this use-case, you will create a sync group to be used between
   gtm1.site1 and gtm1.site2

   -  gtm1.site1 will be used as the “existing GTM”.

   -  gtm1.site2 will be used as the “new GTM”. This unit will end up
      consuming and having a copy of the config from the “existing GTM”.

-  Estimated completion time: 15 minutes

TASK 1 – Create Server Object on GTM1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Log in to **gtm1.site2 (10.1.10.23)** using admin\\admin and notice
       there is no DNS WideIPs, servers, or data centers configured

-  From gtm1.site1 we will need to add GTM2 as a Server object.

-  From gtm1.site1 GUI, navigate to: **DNS > GSLB > Servers > Server List: Create**

+--------------------------------+---------------------------------------------------------------------------------------+
| **Name**                       | site2-gtm                                                                             |
+================================+=======================================================================================+
| **Data Center**                | site2\_datacenter                                                                     |
+--------------------------------+---------------------------------------------------------------------------------------+
| **Devices**                    | Click add and specify Device name: site2-gtm and IP 198.51.100.39; click add and OK   |
+--------------------------------+---------------------------------------------------------------------------------------+
| **Health Monitors**            | BIGIP                                                                                 |
+--------------------------------+---------------------------------------------------------------------------------------+
| **Virtual Server Discovery**   | Disabled                                                                              |
+--------------------------------+---------------------------------------------------------------------------------------+
|                                | Click Finished                                                                        |
+--------------------------------+---------------------------------------------------------------------------------------+

-  .. note:: Notice the gtm2-west server object stays blue on the
      server list screen. This is because we haven’t created the trust
      between the devices yet.
      :name: notice-the-gtm2-west-server-object-stays-blue-on-the-server-list-screen.-this-is-because-we-havent-created-the-trust-between-the-devices-yet.

-  From GTM1 SSH session, issue the following command.
   :name: from-gtm1-ssh-session-issue-the-following-command.

    **bigip\_add 198.51.100.39**

    Type ‘yes’ to proceed and enter ‘default’ as the password.

    \*\*Notice gtm1.site2 should have turned green in the server list

TASK 2 – Create a Synchronization Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  ***On GTM1*** in the GUI, navigate to: **DNS > Settings > GSLB > General.**

-  Enable the **Synchronize** checkbox.

-  Change the Group Name as **EXAMPLE\_group**

-  Enable the **Synchronize DNS Zone Files** checkbox.

   |image26|

TASK 3 – Add New GTM to Synchronization Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will run the **gtm\_add** script to add the “new GTM” to the
synchronization group with the “existing GTM”. Note, **always run this
script on the NEW GTM device**. Running this script on the configured
GTM device will sync to the new device and erase the current
configuration! So be very careful!

-  Use PUTTY to log in to the new **gtm2 (10.128.1.247)** with
   root\\agility and run the following command:

   **gtm\_add 203.0.113.7**

   Type ‘\ **y**\ ’ to proceed. If prompted for a password use
   ‘agility’.

-  To validate the sync group is setup properly, navigate through the
   GUI to see if the configurations are the same. You may want to look
   at the Server definitions, Wide IPs, etc.

-  If the configs look equal, make a change on one GTM and see if it
   shows up on the other. Repeat in the reverse direction. \*\*\ **Note
   - There is NO MASTER! Any change on any GTM in a sync group is
   automatically replicated to all other GTMs in the group**.

.. |image0| image:: 101/media/image1.jpg
   :width: 0.87153in
   :height: 0.76389in
.. |image1| image:: 101/media/image2.jpeg
   :width: 4.37014in
   :height: 2.68472in
.. |image2| image:: 101/media/image3.png
   :width: 4.92690in
   :height: 4.82450in
.. |image3| image:: 101/media/image4.png
   :width: 5.69764in
   :height: 1.06915in
.. |image4| image:: 101/media/image5.png
   :width: 5.96516in
   :height: 4.69950in
.. |image5| image:: 101/media/image6.png
   :width: 5.70994in
   :height: 1.46461in
.. |image6| image:: 101/media/image7.png
   :width: 5.71210in
   :height: 4.44950in
.. |image7| image:: 101/media/image8.png
   :width: 5.70755in
   :height: 1.55844in
.. |image8| image:: 101/media/image9.png
   :width: 5.81667in
   :height: 7.57450in
.. |image9| image:: 101/media/image10.png
   :width: 5.45755in
   :height: 3.09756in
.. |image10| image:: 101/media/image11.png
   :width: 5.42339in
   :height: 1.81474in
.. |image11| image:: 101/media/image12.png
   :width: 5.88788in
   :height: 2.07456in
.. |image12| image:: 101/media/image13.png
   :width: 5.87421in
   :height: 2.90181in
.. |image13| image:: 101/media/image14.png
   :width: 5.79088in
   :height: 1.30569in
.. |image14| image:: 101/media/image15.png
   :width: 5.95755in
   :height: 4.65888in
.. |image15| image:: 101/media/image16.png
   :width: 5.83158in
   :height: 2.91579in
.. |image16| image:: 101/media/image17.png
   :width: 5.84006in
   :height: 2.62320in
.. |image17| image:: 101/media/image18.png
   :width: 5.78342in
   :height: 3.81630in
.. |image18| image:: 101/media/image19.png
   :width: 5.75673in
   :height: 2.85228in
.. |image19| image:: 101/media/image20.png
   :width: 5.46340in
   :height: 3.82040in
.. |image20| image:: 101/media/image21.png
   :width: 5.92339in
   :height: 1.95871in
.. |image21| image:: 101/media/image22.png
   :width: 5.84006in
   :height: 2.72214in
.. |image22| image:: 101/media/image23.png
   :width: 6.00673in
   :height: 1.21945in
.. |image23| image:: 101/media/image24.png
   :width: 5.72121in
   :height: 1.01834in
.. |image24| image:: 101/media/image25.png
   :width: 5.87421in
   :height: 2.87924in
.. |image25| image:: 101/media/image26.png
   :width: 5.32640in
   :height: 3.29175in
.. |image26| image:: 101/media/image27.png
   :width: 4.06103in
   :height: 1.86535in
