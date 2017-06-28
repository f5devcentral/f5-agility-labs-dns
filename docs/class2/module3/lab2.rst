Forwarders
----------

In this use-case, we will configure conditional forwarders with local
zone information.

* Estimated completion time: 5 minutes

Add Forwarder to Existing Cache
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* In the GUI, navigate to: **DNS > Caches > Cache List**. Click on
  **validating-resolver** from the previous exercise. Click **Forward Zones**
  from the top menu.
* Click **Add** and configure as shown in the figure below and then
  click **Finished**:

|image24|

* From your workstation, perform the following recursive queries to your
  external Listener to test.

.. code-block:: console

   dig @10.128.10.54 www.forward.com
   dig @10.128.10.54 mail.forward.com

* In the SSH shell, type the following tmsh command:

.. code-block:: console

   tmsh show ltm dns cache validating-resolver | more

Your output should look similar to below with statistics. Forwarder
Activity stats are of particular interest in this use-case.

|image25|

* In the GUI, you can find similar data as above by navigating
  **Statistics > Module Statistics > DNS > Caches**.
* Select “Statistics Type” of Caches.
* Select “View” under the Details column for validating-resolver

.. |image24| image:: /_static/class2/image27.png
   :width: 4.31000in
   :height: 2.82000in
.. |image25| image:: /_static/class2/image28.png
   :width: 5.76000in
   :height: 3.47000in
