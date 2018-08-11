Sync Group
==================================

After the BIG-IP DNS server in the site 2 data center is joined to the sync group, an administrator may make changes on any of the F5 DNS servers, and changes will be automatically replicated across all F5 DNS servers.

From the Jumpbox Launch Putty and log in to gtm1.site2

In the Putty terminal logged into gtm1.site2 run the command "gtm_add 203.0.113.7", and enter the password "default" when prompted.

Select "y" to allow the bigip-ip to join the mesh.

.. note::  **A word of caution. Running this command will PULL configuration from the remote BIG-IP DNS and overwrite the local DNS configuration.**

.. image:: /_static/class1/putty_gtm1_site2.png

.. admonition:: TMSH

   gtm_add 203.0.113.7
