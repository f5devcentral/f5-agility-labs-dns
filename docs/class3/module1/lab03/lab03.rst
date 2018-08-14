Listeners
############################################

A listener object is a specialized BIG-IP DNS virtual server that is configured to respond to DNS queries. Without a listener, the BIG-IP DNS server has no open socket to 'listen' for queries.

Create both a TCP and UDP listener. UDP is the standard for DNS name resolution, and TCP is used when a DNS response greater than 4096 bytes in size is required as well as for zone transfers.

.. image:: ../../media/class1_listeners.png
  :align: left

.. toctree::
   :maxdepth: 2
   :hidden:
   :glob:

   task*
