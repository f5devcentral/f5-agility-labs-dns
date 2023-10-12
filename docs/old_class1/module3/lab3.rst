Sync Group
==================================

After the BIG-IP DNS server in datacenter 2 is joined to the sync group, administrators may make changes to either F5 DNS server.

Changes will be automatically replicated across all F5 DNS servers.

Launch Putty and log in to gtm1.site2

Run the following command: Enter the password "default" when prompted.

Select "y" to allow the bigip-ip to join the mesh.

.. admonition:: TMSH

   gtm_add 203.0.113.7

.. image:: /_static/class1/putty_gtm1_site2.png
