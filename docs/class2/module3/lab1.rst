Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Log in to https://router01.branch01.example.com/xui/

Navigate to: **System > Logs > Configuration > Log Publishers: Create**
Create a new DNS Log Publisher as shown in the table below.

*Keep the defaults if not noted in the table.*

+--------------------+----------------------------------------+
| **Name**           | dns-local-syslog                       |
+====================+========================================+
| **Destinations**   | Move local-syslog to Selected column   |
+--------------------+----------------------------------------+

* Click **Finished** to create.
* In the GUI, navigate to: **DNS > Delivery > Profiles > Other > DNS Logging: Create**
* Create a new DNS logging profile as shown in the table below.

*Keep the defaults if not noted in the table.*

+------------------------+---------------------------+
| **Name**               | dns-logging               |
+========================+===========================+
| **Log Publisher**      | Select dns-local-syslog   |
+------------------------+---------------------------+
| **Log Responses**      | Enabled                   |
+------------------------+---------------------------+
| **Include Query ID**   | Enabled                   |
+------------------------+---------------------------+

* Click **Finished** to create.
* Your new dns-logging profile should now have all options enabled.

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
