DNSSEC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will now sign the dnsx.com zone. In this example, we are configuring
GTM to sign the zone on the fly rather than signing the actual static
zone information (which can be done starting in v11.5 but is outside the
scope of this lab).

* In the GUI, navigate to: **DNS > Delivery > Keys > DNSSEC Key List: Create**
* Create two keys as defined in the tables below.

*Keep the defaults if not noted in the table.*

+----------------------+--------------------+
| **Name**             | dnsx.com\_zsk      |
+======================+====================+
| **Type**             | Zone Signing Key   |
+----------------------+--------------------+
| **Key Management**   | Manual             |
+----------------------+--------------------+
| **Certificate**      | default.crt        |
+----------------------+--------------------+
| **Private Key**      | default.key        |
+----------------------+--------------------+

+----------------------+-------------------+
| **Name**             | dnsx.com\_ksk     |
+======================+===================+
| **Type**             | Key Signing Key   |
+----------------------+-------------------+
| **Key Management**   | Manual            |
+----------------------+-------------------+
| **Certificate**      | default.crt       |
+----------------------+-------------------+
| **Private Key**      | default.key       |
+----------------------+-------------------+

* Click **Finished** to create each key.
* In the GUI, navigate to: **DNS > Zones > DNSSEC Zones > DNSSEC Zone List: Create**
* Configure the dnsx.com zone for DNSSEC using the previously created
  keys as shown below.

|image3|

* Test that the zone is successfully signed by issuing a DNSSEC query
  to the external listener. For example:

.. code-block:: console

   dig @203.0.113.8 +dnssec www1.dnsx.com

You should see RRSIG records indicating that the zone is signed. You
will also note signing in the query logs (``/var/log/ltm``)

* Finally, view some other DNS statistics related to queries, DNSSEC, zone transfers, notifies, etc.
* In the GUI, navigate to: **DNS > Zone > Zones > Zone List.**
* Click on the “dnsx.com” zone and then select “Statistics” from the top menu bar.
* Select the “View” Details as shown in the diagram below:

|image4|

* View the types of statistics available for the zone such as serial number, number of records, etc.
* In the GUI, navigate to: **Statistics > Module Statistics > DNS > Zones**.
* Set “Statistics Type” to **“DNSSEC Zones”.**
* View details as performed above. Note the various DNSSEC statistics available.
* If the graphs from task 5 weren’t available earlier, revisit
  **Statistics > Analytics > DNS** now and explore.

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
