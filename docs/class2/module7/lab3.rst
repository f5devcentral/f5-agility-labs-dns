Results
###########################

From the CLI on the router01.branch01 BIGIP run

tail -f /var/log/ltm

From the Workstation command prompt run "dig example.com" and check for the results

.. image:: /class2/media/mod7lab3-results1.png

From the Workstation command prompt run "dig sex.com" and check for the results
 
.. image:: /class2/media/mod7lab3-results2.png

Navigate to: **DNS  ››  Delivery : iRules : iRules List**

.. image:: /class2/media/irule-new.png 

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/rule/list.jsp

Click on the DNS-query-filtering iRule and add new filtering category "News_and_Media"

.. image:: /class2/media/news.png 

Try opening a web broswer and navigating to www.foxnews.com

From the Workstation command prompt run "dig cnn.com" and check for the results

.. image:: /class2/media/mod7lab3-results3.png 
