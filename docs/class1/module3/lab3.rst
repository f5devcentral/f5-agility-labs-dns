Sync Group
==================================

After the BIG-IP DNS server in datacenter B is joined to the sync group, administrators may make changes to either F5 DNS server.

Changes will be automatically replicated across all F5 DNS servers.

Launch WEB SHELL and log in to dns.siteb
.. image:: /_static/class1/putty_gtm1_site2.png
   :width: 800

Run the following command: Enter the password "F5demo!!" when prompted.

.. admonition:: TMSH

   gtm_add 10.1.10.100

The 'gtm_add' command will pull the configuration from the source overwriting any existing GSLB configuration on the system where the command is run

Select "y" to allow the bigip-ip to join the mesh.

If there are issues run 

.. admonition:: TMSH

   bigstart restart named zrd
