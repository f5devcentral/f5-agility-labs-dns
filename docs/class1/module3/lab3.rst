Sync Group Formation
==================================

The BIG-IP DNS server in datacenter two needs to join the "sync group"

Launch Putty and log in to gtm1.site2

Run the following command: Enter the password "default" when prompted.

Select "y" to allow the bigip-ip to join the mesh.

.. admonition:: TMSH

   gtm_add 203.0.113.7

.. image:: /_static/class1/putty_gtm1_site2.png
