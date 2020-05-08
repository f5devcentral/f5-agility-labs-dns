Proxying Traditional DNS queries to DNS over HTTPS
--------------------------------------------------

Finally, let’s look at converting a DNS query to a DoH request.

Test Driving Traditional DNS to DNS over HTTPS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We’ll once again use **kdig** as we’re simply generating a traditional
DNS request.

``kdig @10.1.10.102 www.f5agility.com``

You’ll get a response as shown below:

|image38.png|

Viewing Statistics for DNS-to-DoH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Back on the BIG-IP, we’ll see connections on the DNS-to-DoH virtual
server:

|image39.png|

If we set the statistics type to *iRulesLX*, we’ll see RPC connections
on the iRule for this translation:

|image40.png|

Capturing Traditional DNS to DNS over HTTPS Traffic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Running a packet capture, we can see the front-end udp/53 requests being
translated to DoH requests:

``tcpdump -nni 0.0 (host 10.1.10.102 and port 53) or (host 8.8.4.4 or host 8.8.8.8 and port 443)``

:NOTICE: If your packet capture is “noisy,” removing the HTTPS monitor from the “doh_google.dns” pool will stop the intermittent queries.

Notice that a port 53 request comes in, a HTTPS connection is set up and
the query is passed, then the port 53 response is sent to the client
before the HTTPS connection is torn down.

|image41.png|

This concludes the hands-on portion of the lab. Feel free to explore and
test the environment if there is time remaining.

.. |image38.png| image:: _images/image38.png
   :width: 7.5in
   :height: 2.99202in
.. |image39.png| image:: _images/image39.png
   :width: 7.5in
   :height: 3.50243in
.. |image40.png| image:: _images/image40.png
   :width: 7.5in
   :height: 3.59375in
.. |image41.png| image:: _images/image41.png
   :width: 7.5in
   :height: 1.45278in
