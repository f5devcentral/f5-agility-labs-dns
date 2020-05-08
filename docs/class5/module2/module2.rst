Proxying DNS over TLS Queries to Traditional DNS
------------------------------------------------

DoT-to-DNS is a bit more simplistic. We’re simply taking the existing DNS request and encapsulating it in TLS. No iRule magic needed here; just classic BIG-IP high-performance SSL offloading.

**The client-SSL profile on this virtual server specifies that SSL/TLS termination should occur on the client side of the connection.**

Virtual Server Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Maximize *Firefox*. Click on the first tab to return to the BIG-IP web UI. Navigate to **Local Traffic** -> **Virtual Servers**. If you review the virtual server configuration, you’ll notice that we’re simply using a client-SSL profile and a backend pool. The client-SSL profile utilizes a self-signed certificate in this lab, you'll need a certificate from a certificate authority that your clients' browsers trust in a production deployment.

|image28.png|

Clicking on **Resources** tab on the top navigation bar will show that the virtual server has a simple pool and no iRules attached.

|image29.png|

Test Driving DNS over TLS to Traditional DNS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Minimize Firefox to view the desktop shortcuts and launch the Lab DNS Server client. You’ll be automatically logged in. Let’s run a DNS over TLS query:

``kdig +tls @10.1.10.100 www.f5.com``

You should see a response similar to the output below. Run a few more queries against other domains to generate statistics.

|image30.png|

Viewing Statistics for DoT-to-DNS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can then see statistics on the virtual server by navigating to **Statistics** -> **Module Statistics** -> **Local Traffic** and selecting *Virtual Servers* in the drop-down list.

|image31.png|

Because this virtual server is taking advantage of backend pools, you will see statistics under the *Pools* statistics type as well.

|image32.png|

Because we don’t have any type of logging configured for that virtual server, you won’t see any information in **System** -> **Logs** for this traffic. If you'd desire logging in your environment, general LTM F5 logging/statistics practices can be used.

Capturing DNS over TLS to Traditional DNS Traffic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Minimize Firefox and return to the BIG-IP DNS Proxy session from the first section of this lab, or open a new session by clicking on the BIG-IP DNS Proxy icon on the desktop. Execute the follow tcpdump command:

``tcpdump -nni 0.0 port 53 or port 853``

Pull the Lab DNS Server session window up and re-run the **kdig** command. Observe the front and back-end connections using port 853 and 53, respectively, shown in the packet capture output.

|image33.png|

Stop your capture before moving on to the next section. This concludes the DoT-to-DNS portion of the lab.

.. |image28.png| image:: _images/image28.png
   :width: 7.5in
   :height: 10in
.. |image29.png| image:: _images/image29.png
   :width: 7.5in
   :height: 6.98222in
.. |image30.png| image:: _images/image30.png
   :width: 7.5in
   :height: 4.76136in
.. |image31.png| image:: _images/image31.png
   :width: 7.5in
   :height: 3.45313in
.. |image32.png| image:: _images/image32.png
   :width: 7.5in
   :height: 3.51563in
.. |image33.png| image:: _images/image33.png
   :width: 7.5in
   :height: 4.49479in