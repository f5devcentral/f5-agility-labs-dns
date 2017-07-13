Listeners
~~~~~~~~~~~~~~~~~~~~~

We are going to create both UDP and TCP external listeners. The
external Listener will be our target IP address when querying GTM.

* In the GUI, navigate to: **DNS > Delivery > Listeners > Listener List: Create**
* Create two **external** Listeners as shown in the tables below.

*Keep the defaults if not noted in the table.*

+-------------------------+-------------------------+
| **Name**                | external-listener-UDP   |
+=========================+=========================+
| **Destination**         | Host: 203.0.113.8       |
+-------------------------+-------------------------+
| **VLAN Traffic**        | Enabled on..            |
+-------------------------+-------------------------+
| **VLANs and Tunnels**   | External                |
+-------------------------+-------------------------+
| **DNS Profile**         | AuthNS-offbox-BIND      |
+-------------------------+-------------------------+

+-------------------------+-------------------------+
| **Name**                | external-listener-TCP   |
+=========================+=========================+
| **Destination**         | Host: 203.0.113.8       |
+-------------------------+-------------------------+
| **VLAN Traffic**        | Enabled on..            |
+-------------------------+-------------------------+
| **VLANs and Tunnels**   | External                |
+-------------------------+-------------------------+
| **Protocol**            | TCP                     |
+-------------------------+-------------------------+
| **DNS Profile**         | AuthNS-offbox-BIND      |
+-------------------------+-------------------------+

* For each Listener, click **Finished** to create.

* You should now have two UDP-based DNS Listeners and two TCP-based
  Listeners configured.

.. |image0| image:: /_static/class2/image2.png
   :width: 5.30972in
   :height: 2.02776in
.. |image1| image:: /_static/class2/image4.png
   :width: 3.93000in
   :height: 3.05000in
.. |image2| image:: /_static/class2/image5.png
   :width: 2.66667in
   :height: 1.41319in
.. |image3| image:: /_static/class2/image6.png
   :width: 3.23729in
   :height: 2.35556in
.. |image4| image:: /_static/class2/image7.png
   :width: 3.96000in
   :height: 1.71000in
