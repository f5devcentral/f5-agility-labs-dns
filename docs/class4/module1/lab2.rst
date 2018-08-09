Lab – Examine GSLB objects 
--------------------------


In the previous lab we reviewed the basic config and then set up a couple of terminal sessions to watch the dns logs.
In this lab we will move forward and examine the GSLB objects that are set up, inspect listeners pool members and other GSLB objects 

Task – Examine the DNS listeners and their profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


In this task we will examine the listeners set up and make sure the dns profiles are set up correctly.

Follow these steps to complete this task:

.. rst-class:: task-stepsx

#. On both east and west F5s take a look at the listeners and remember the IPs as you will need them..
#. Navigate to **DNS >> Delivery: Listeners: Listener List** and select the listener your interested in viewing.
#. Make sure that the right dns profile is selected for the listeners.  Also are there two listeners?

..  image:: /_static/dns_listeners.png


Task – Review the DNS GSLB server objects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


In this task we will review the servers used in the GSLB configuration.

Follow these steps to complete this task:

#. Navigate your browser to **DNS >> GSLB : Servers**
#. Inspect the servers.  Identify the servers and the underlying objects associated with them.
#. What is the state of the servers , green?

..  image:: /_static/gslb_servers.png

Task – Review the DNS GSLB Data Center objects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will review the data centers used in the GSLB configuration.

Follow these steps to complete this task:

#. Navigate your browser to **DNS >> GSLB : Data Centers**
#. Inspect the data centers.  
#. What is the what happens when you disable a DC?  Discuss.

..  image:: /_static/data_centers.png

Task – Review the DNS Pools and examine the LB algorithm
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will review the pools used in the GSLB configuration.

Follow these steps to complete this task:

#. Navigate your browser to **DNS >> GSLB : Pools**
#. Inspect the Pools and understand their algorithm.
#. What is the what happens If you changed this ? would it make a difference?  Discuss.

..  image:: /_static/gslb_pools.png


Task – Review the GSLB WideIP and its configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will review the WideIP used in the GSLB configuration.

Follow these steps to complete this task:

#. Navigate your browser to **DNS >> GSLB : WideIP**
#. Inspect the WideIP and understand the configuration settings, LB algorithm, logging settings.

#. Do you notice anything new here? Use the built in help for the explination.

..  image:: /_static/wideip.png

Task – Review the Global GSLB settings for Client Subnet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will review the Global client subnet settings used in the GSLB configuration.

Follow these steps to complete this task:

#. Navigate your browser to **DNS >> Settings : GSLB: Load Balancing**
#. Under Topology, take a look at the "Prefer Client Subnet" option... 
#. Open the help tab and take a look at the included documentation.


..  image:: /_static/global_gslb_client_subnet.png

Task – Review the  GSLB Topology records 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will review the GSLB topology records used in the configuration.

Follow these steps to complete this task:

#. Navigate your browser to **DNS >> GSLB : Topology: Records**
#. Review the records and understand their use. 

when you check out the topology records you will see that we have created a topology record that matches the local subnet coming from the querier and then another record was added to simulate a different client subnet sent by the dig query with edns0.  

..  image:: /_static/topo_records.png

