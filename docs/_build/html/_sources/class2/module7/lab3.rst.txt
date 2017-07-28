Results
###########################

From the CLI on the router01.branch01 BIGIP run

tail -f /var/log/ltm

From the Workstation command prompt run "dig example.com" and check for the results

.. image:: /_static/class2/examplecom.png

From the Workstation command prompt run "dig porno.com" and check for the results
 
.. image:: /_static/class2/pornocom.png

Navigate to: **DNS  ››  Delivery : iRules : iRules List**

.. image:: /_static/class2/irule-new.png 

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/rule/list.jsp

Click on the DNS-query-filtering iRule and add new filtering category "News_and_Media"

.. image:: /_static/class2/news.png 

From the Workstation command prompt run "dig cnn.com" and check for the results

.. image:: /_static/class2/cnn.png 
