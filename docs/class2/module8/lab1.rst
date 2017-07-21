Create an iRule
############################

Navigate to: **DNS  ››  Delivery : iRules : iRules List**

.. image:: /_static/class2/irule-new.png 

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/rule/list.jsp

Create new iRule, copy the content below and paste it.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, IPInteliigence_irule

.. code-block:: tcl
   :emphasize-lines: 10

TODO: get updated irule from Brian Van Lieu
 
.. admonition:: TMSH

   tmsh create ltm rule IPIntelligence_irule

