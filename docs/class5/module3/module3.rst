Proxying Traditional DNS to DNS over TLS
----------------------------------------

In this section of the lab, we’re going to run DoT in the opposite direction, taking traditional DNS requests and translating them into DoT requests. This is done as simply as the DoT-to-DNS; we simply take the incoming DNS connection (UDP or TCP) and encapsulate it in TLS using a server-side SSL profile.

Test Driving Traditional DNS to DNS over TLS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On the Lab DNS Server, issue the following command:

``kdig @10.1.10.101 www.yahoo.com``

You should receive a successful response as shown below:

|image34.png|

Viewing Statistics for DNS-to-DoT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Restore Firefox and click on the first tab to return to the BIG-IP web UI. You can then see statistics on the virtual server by navigating to Statistics -> Module Statistics -> Local Traffic and selecting Virtual Servers in the drop-down list.

|image35.png|

Back on the Lab DNS Server, issue the same kdig command with the TCP option to increment the counters on the corresponding virtual server:

``kdig +tcp @10.1.10.101 www.f5.com``

|image36.png|

Since this is basic LTM functionality, general LTM logging practices can be used if you wish to log traffic in your environment.

Capturing Traditional DNS to DNS over TLS Traffic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On the BIG-IP CLI, we can see the 53/853 exchange on a packet capture using the same **tcpdump** command we used in the DoT-to-DNS section, as the IP/ports are simply being switched around. In the BIG-IP DNS Proxy session, issue the following command:

``tcpdump -nni 0.0 (host 10.1.20.10 or 10.1.1.6) and (port 53 or port 853)``

When running kdig commands on the Lab DNS Server, you will see the port 53 and port 853 connections in the output, as shown below.

|image37.png|

Stop your capture before moving on to the next section. This concludes the DNS-to-DoT section.

.. |image34.png| image:: _images/image34.png
.. |image35.png| image:: _images/image35.png
.. |image36.png| image:: _images/image36.png
.. |image37.png| image:: _images/image37.png