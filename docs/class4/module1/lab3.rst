Lab – Use DIG command to query with client subnet GSLB objects 
--------------------------------------------------------------

In this lab, we will utilize the dig command on a linux machine to query the F5 dns engines 
and observe the responses sent.  We will change the options on the dig command to use the new client subnet option.

We will be using a new version of the dig command. My hope is you should be familiar with the general use of the dig command
from your previous work with DNS.

The new version of Dig is version 9.10 and it includes an option called the "edns-client-subnet" which allows us to insert 
the client subnet in the query.

As the client itself cannot insert the client subnet in the query we use the dig command to simulate a query coming from a LDNS which has already inserted the client subnet.

Due to the restrictions on lab resources we have tried to keep this lab of such a size not to be too large or cumbersome, for this reason we will use the dig command instead of a LDNS.

Task – Log into the linux server and check out the new dig command
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task you will open a terminal session and ssh to the linux server to use the local new version of dig.

Follow these steps to complete this task:

#. Log into the linux server at 10.1.0.245 using the user named ubuntu and the password ubuntu
#. Once logged into the linux server check out the linux dig command by typing ``dig -v``
#. Take a look at the following output ``dig -h | grep subnet``
#. Now do a simple query for the wideip that is configured on one of the east or west DC listener IPs ``dig @listener_IP app.f5demo.com``

..  image:: /_static/dig_cmd.png

Task – View the query logs and observe the dig query
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have the new dig command we are almost ready to do some querys but it would be nice to see the query and decision logs
that we are looking for just to make sure things are going correctly and we see any output that might be different than we might expect.

#. Open two new terminal windows if you do not have them open from previous sessions, logging into both the East and West DC BigIPs.
#. Once you have logged in as admin you can then ``tail -f /var/log/ltm`` in both windows to view the logs for the listeners.

..  image:: /_static/query_log.png


Task – Use the +subnet option in dig to change the client subnet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lets test to see if the client subnet affects the response given by the topology records in our GSLB configuration. 
To do this we will be using our friend dig.

#. Use the dig command to hit your favorite listener and query the wideip ``app.f5demo.com``
#. ``dig @10.1.0.245 app.f5demo.com``
#. Change the client subnet using ``dig @10.1.0.245 app.f5demo.com=9.9.9.0/24``
#. Examine the response and the logs to see what decision was made ... why?
#. Change your query request to include a matching client subnet for a topology record that matches the configuration. ``dig @10.1.0.245 app.f5demo.com=1.2.2.0/24`` .

..  image:: /_static/dig_client_subnet.png

