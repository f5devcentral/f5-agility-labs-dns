DNS Profile
~~~~~~~~~~~~~~~~~~~~~~~~~

Navigate to: **Local Traffic  ››  Profiles : Services : DNS**

Local Traffic  ››  Profiles : Services : DNS

Create a new DNS profile as shown in the table below.


+------------------------------------+--------------------------------+
| **Name**                           | AuthNS-offbox-BIND             |
+====================================+================================+
| **Unhandled Query Action**         | Drop                           |
+------------------------------------+--------------------------------+
| **Use BIND Server on Big-IP**      | Disabled                       |
+------------------------------------+--------------------------------+
| **Logging**                        | Enabled                        |
+------------------------------------+--------------------------------+
| **Logging Profile**                | dns-logging                    |
+------------------------------------+--------------------------------+
| **AVR Statistics Sampling Rate**   | Enabled; 1/1 queries sampled   |
+------------------------------------+--------------------------------+

* Click **Finished** to create.
* For lab purposes, we are going to use sample all DNS queries with AVR.

.. NOTE:: production sampling rates would be a much lower rate
   as this would severely impact performance.

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
