Lab – Setup lab and get logged into the components
--------------------------------------------------


This lab you will log into the jumpbox and then log into the east and west f5 dns nodes and inspect.

Task – Review basic configurations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


In this task you will open a web browser and navigate east and west nodes. 

Follow these steps to complete this task:

#. Log into the jumphost with the credentials provided in the setup section.
#. Open your web browser in the jumphost window.
#. Navigate to the east DC F5 and open another tab for the west DC.
#. Login with the username and password from the setup section.
#. After logging in take a look at the different settings for the interfaces and ip addresses and examine things to become comfortable with the enviornment and the two devices.


Task – Review the DNS profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


In this task you will review the dns profile used on the listeners and take note of any non-default configuration options.
You will see three major changes.  One of them is very important to EDNS0 client subnet operation, make sure that you understand that there is no button labeled "EDNS0" of any sort.





Follow these steps to complete this task:

#. Navigate to "DNS : Delivery : Profiles : DNS "
#. Click the dns_nobind_edns0 profile and examine the options set.

..  image:: /_static/dns_profile.png

Task – Review the DNS Logging profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow these steps to complete this task:

#. Navigate to "DNS : Delivery : Profiles : Other : DNS Logging "
#. Click the dnslog_profile profile and examine the options set.
#. Examine the log publisher by navigating to "System: Logs: Configuration: Log Publishers" and click on "local-log"


..  image:: /_static/dns_log_profile.png
..  image:: /_static/dns_log_settings.png

Task - Open a terminal session to view the log output
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow these steps to complete this task:

#. Open the terminal application on the jumphost
#. Log into the GTM east and west in different windows via ssh using the admin login and use the following command to tail the log file.

``tail -f /var/log/ltm``

..  image:: /_static/ssh_tail_log.png

