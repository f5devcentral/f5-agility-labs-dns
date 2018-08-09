Lab – Use TCPdump and Wireshark to analyze DNS ends0 client subnet transactions 
-------------------------------------------------------------------------------

In this lab, we will utilize the tcpdump utility to capture DNS queries to the 
F5 BIGIP DNS listeners.

Next we will use wireshark on the jumphost to examine the queries and responses
edns0 information to see the ECS (client subnet) information.

Last, we will change our query to the BIND server and use tcpdump/wireshark to examine 
the LDNS behavior of BIND.

As in the previous lab, we will be using a new version of the dig command. 
You should be familiar with the general use of the dig command
from your previous labs and work with DNS.

Task – Use tcpdump to capture dns queries from the linux jumphost
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow these steps to complete this task:

#. Log into the BIGIP DNS via ssh admin@10.0.1.245 and use the command ``tcpdump -nnni 0.0 port 53 -w /tmp/edns0.pcap``
#. Use the jumphost to query the listener with a edns0 query: ``dig @10.1.0.245 app.f5demo.com +subnet=9.9.9.0/24``
#. Once the query and response are complete stop the capture with a ctrl-c. 
#. Copy the file from the BIGIP to the jumphost using the scp command ``scp admin@10.1.0.245:/tmp/edns0.pcap .``
#. Start wireshark by typing the following into a terminal ``wireshark &``
#. Once wireshark is open, choose file->open and open the edns0.pcap file in wireshark.
#. Open up the DNS query and examine the ends0 section. It is under the "Additional Records" arrow. What is the client subnet set to? 

..  image:: /_static/wireshark_edns0.png

Task - Use wireshark to view a client dns request from the linux jumphost

This task is pretty simple but looking at the client request should in theory look just like the request captured at the DNS listener.


#. Start wireshark and start a new capture on the ethernet interface of the jumphost.
#. Filter for DNS packets (port 53) 
#. Use a terminal window to send a ``dig @10.1.0.245 app.f5demo.com=9.9.9.0/24`` 
#. send a new dig command to 8.8.8.8 and look at the response... ``dig @8.8.8.8 www.microsoft.com +subnet=8.7.6.0/24``
#. Inspect the dns request and the response packets, and look to see if you can see any difference between the last tasks output.
#. Notice the difference in the dig output between the query to the BIGIP DNS listener and 8.8.8.8.

..  image:: /_static/dig_msft.png

