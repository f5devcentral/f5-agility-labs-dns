Clean Up
========

#. Send the **Retire DNS Zone** to remove or reset zone file. You will get response with status code "200 OK".

   .. figure:: ../_figures/120.jpg

#. We recommend that you clear your tokens from the Lab Service API for security purposes. In order to do that, send the **Logout** request, which uses your **ACCESS_TOKEN**:
   
   .. figure:: ../_figures/79.png

#. You will get the following response with the status showing "200 OK":
   
   .. figure:: ../_figures/80.png
   
#. Your **ACCESS_TOKEN** will be considered invalid:
   
   .. figure:: ../_figures/81.png
