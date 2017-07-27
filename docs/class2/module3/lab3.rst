Results
##################################

#. Click on the newly created DNS Express zone and make sure it is showing green for 'Available' indicating that the initial AXFR transfer was successful.

   .. image:: /_static/class2/DNS_Express_result1.png

#. Using putty from the taskbar, log in to router01.branch01.example.com.

  Run the following command to see the contents of the DNS Express database:

   .. code-block:: console

      dnsxdump | less

   Examine the results

   .. image:: /_static/class2/DNS_Express_result3.png
