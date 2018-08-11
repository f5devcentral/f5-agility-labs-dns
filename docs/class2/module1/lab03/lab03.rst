Listeners
############################################

A listener object is a specialized BIG-IP DNS virtual server that is configured to respond to DNS queries. Without a listener, the BIG-IP DNS server has no open socket to 'listen' for queries.

We need to create both a TCP and UDP listener. UDP is of course the standard for DNS name resolution. Knowing this, then why TCP ? TCP is used when a DNS response greater than 4096 bytes in size is required and/or for zone transfers.

.. image:: /_static/class1/class1_listeners.png
  :align: left

.. toctree::
   :maxdepth: 2
   :hidden:
   :glob:

   task*
