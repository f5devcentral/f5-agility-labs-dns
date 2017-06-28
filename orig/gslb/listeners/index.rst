############################################
Listeners
############################################

A listener object is an spcialized virtual server that is configured to respond to DNS queries.

We will be creating both TCP and UDP based listeners.

.. note:: Why do we need to create both a UDP and a TCP listener here?  What would happen if the DNS query or response was greater than 512 bytes?

.. toctree::
   :maxdepth: 1
   :hidden:

   logging.rst
   dns.rst
   udp.rst
   tcp.rst
   udp_listener.rst
   tcp_listener.rst
