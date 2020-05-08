BIG-IP Configuration Review
---------------------------

Launch your RDP client and connect to the Windows Jump Host.

|image2.png|

Click “No” to close the network discovery prompt.

Click on the Firefox icon to launch the browser.

Three tabs will open up. The first tab is the UI of the BIG-IP. Let’s
login using **admin** for our username and **f5agility2020** as our
password.

|image3.png|

You should see the license screen initially. Let’s take a look at the
configuration before we proceed with testing the proxy.

System Configuration
~~~~~~~~~~~~~~~~~~~~

Resource Provisioning
^^^^^^^^^^^^^^^^^^^^^

First, let’s look at how the platform’s modules are provisioned.
Navigate to **System** -> **Resource Provisioning** in the menu. You
will see that we have LTM and iRulesLX provisioned. We’ll need both of
these modules for handling DNS connections and translating between DNS
and HTTPS.

|image4.png|

NTP
^^^

Next, let’s look at a few key system settings necessary for overall
system health. Navigate to **System** -> **Configuration** -> **Device**
-> **NTP**. It’s important that NTP is configured and working properly,
especially when a BIG-IQ is paired or managed by BIG-IQ.

|image5.png|

DNS
^^^

Navigate to **System** -> **Configuration** -> **Device** -> **DNS**

Because we’re using FQDNs in our iRules and DNS pools, we’ll need DNS
resolvers that the system can use.

**If you didn’t want to use public DNS servers in a certain environment,
you could simply assign static addresses to pool members and resolvers
to alleviate this requirement.**

|image6.png|

Network Configuration
~~~~~~~~~~~~~~~~~~~~~

The BIG-IP sits in two VLANs with self-IPs in each. One side serves up
the DNS VIPs and the other is used to reach DNS servers. If you wish to
view this portion of the config, you can click on the respective
sections under the Network menu. Please do not make any changes.

|image7.png|

Local Traffic Manager (LTM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let’s now look at the portion of the configuration that is performing
the heavy lifting – the LTM configuration.

Nodes
^^^^^

Navigate to **Local Traffic** -> **Nodes** and look at the node list.
Here, we’re resolving dns.google and automatically creating pool members
based on the records returned.

|image8.png|

Pools
^^^^^

If you’ll kindly navigate to **Local Traffic** -> **Pools**, you will
see three pools. While the backend nodes are identical between them, the
ports used for each are not. You’ll see a pool for DNS over HTTPS
(doh_dns.google) that uses port 443, a pool for DNS over TLS
(dot_dns.google) that utilizes port 853 and finally a pool that uses
port 53 for traditional DNS services (traditional_dns.google). If you’re
not familiar with LTM pools, click through each pool to see how the
service ports are specified.

|image9.png|

iRulesLX
^^^^^^^^

iRulesLX engine based on Node.js is the mechanism that we will leverage
to handle DNS over HTTPS translations. DoH requests either arrive at the
BIG-IP in an HTTPS POST with a binary payload or a base64url- encoded
GET request parameter. We’ll need to transpose the data from these
requests and translate into a traditional DNS request (DoH-to-DNS). We
can also take a traditional DNS request and encapsulate it into a DoH
request using iRulesLX.

Workspaces
''''''''''

If you’ll navigate to **Local Traffic** -> **iRules** -> **LX
Workspaces**, you can see the two rules for handling conversions in
their respective direction. Click on the rule titled *DNS_to_DoH_Proxy*.

|image10.png|

DNS to DoH Proxy
""""""""""""""""

Click on the *DNS_to_DoH_Proxy* item under the *rules* section of
**Workspace Files**. The first rule, *DNS_to_DoH_Proxy*, has two
components. The classic iRule, which is written in TCL, is used to nab
data from the incoming payload and pass it off to iRulesLX. The
ILX::init function is called and the entire UDP payload is simply passed
to iRulesLX using base64 encoding. Once the request is processed, the
response will be returned to this iRule, which will be base64 decoded
and passed to the client.

|image11.png|

Click on the *index.js* file under the *dns_over_https* section of
**Workspace Files**. The iRulesLX portion takes the DNS packet’s payload
and sends it to a remote DoH server as a binary payload using the HTTP
POST method. The response, which will also be binary, gets base64
encoded and passed back to the TCL portion of the iRule, which then
sends the request back to the client.

|image12.png|

DoH to DNS Proxy
""""""""""""""""

Navigate back to the iRulesLX Workspace list (**Local Traffic** ->
**iRules** -> **iRulesLX Workspaces**) and view the *DoH_to_DNS_Proxy*
iRule. Click on the *DoH_to_DNS_Proxy* item under the *rules* section of
**Workspace Files**. This conversion is a more intensive task.

First, POST and GET are both valid DoH request methods, but have
different payloads. POST payloads are binary and GET requests are
base64url encoded in the URI request, so we need to treat them
separately.

Since POST has the request in the actual HTTP payload, we’ll have to
grab that information, perform base64 encoding and pass it along to
iRulesLX to process.

For GET requests, we can simply send the base64url-encoded GET
parameter. In both cases, we’ll also have to wait for a response from
the iRulesLX engine, which is handled in this portion of the iRule as
well.

There is a slight distinction between base64 and base64url encoding! For
more information, see https://en.wikipedia.org/wiki/Base64.

|image13.png|

Click on the *index.js* item under *DoH_to_DNS_Proxy* section of
**Workspace Files**. For the iRulesLX portion, the script has several
steps it must perform.

First, we need to get the DoH request into a traditional DNS request
packet. Not only that, but we need check for truncated responses from
UDP requests and resend them as TCP requests. Once we have a response
from the DNS server, we’ll need to encode it to pass back to TCL so the
final response can be returned to the server.

The process intensive iRule can take advantage of the BIG-IPs native SSL
and TCP protocol accelerations, greatly increasing the volume of
requests that can be handled.

|image14.png|

Plugins
'''''''

Navigate to **Local Traffic** -> **iRules** -> **LX Plugins**. This is
where a workspace is mapped to a plug-in. This allows you to make
changes to the workspace without committing those changes immediately.

|image15.png|

Virtual Servers 
^^^^^^^^^^^^^^^

Finally, let’s take a look at the virtual servers handling incoming
requests. Navigating to **Local Traffic** -> **Virtual Servers** will
bring up the list.

Notice that we have 5 scenarios to cover in order to handle DNS
translations in either direction.

First, the DNS-to-DoH virtual server handles incoming traditional DNS
requests and encapsulates them to a backend DoH server. The next two
rules handle DNS-to-DoT for both inbound TCP and UDP requests. An
example use case for these proxies would be offering encrypted DNS
services to client software/hardware that doesn’t support DoH/DoT.

The next two rules handle inbound DoH and DoT requests, respectively. An
example use case for these proxies would be for offering DoH/DoT to
clients/customers/etc. without the need for modifying existing DNS
infrastructure.

|image16.png|


.. |image2.png| image:: _images/image2.png
   :width: 7.5in
   :height: 4.6875in
.. |image3.png| image:: _images/image3.png
   :width: 7.5in
   :height: 4.6875in
.. |image4.png| image:: _images/image4.png
   :width: 7.5in
   :height: 4.47917in
.. |image5.png| image:: _images/image5.png
   :width: 7.5in
   :height: 4.48438in
.. |image6.png| image:: _images/image6.png
   :width: 7.5in
   :height: 4.4775in
.. |image7.png| image:: _images/image7.png
   :width: 2.39879in
   :height: 2.88051in
.. |image8.png| image:: _images/image8.png
   :width: 7.5in
   :height: 4.47917in
.. |image9.png| image:: _images/image9.png
   :width: 7.5in
   :height: 4.47917in
.. |image10.png| image:: _images/image10.png
   :width: 7.5in
   :height: 3.89006in
.. |image11.png| image:: _images/image11.png
   :width: 7.5in
   :height: 4.47917in
.. |image12.png| image:: _images/image12.png
   :width: 7.5in
   :height: 4.47396in
.. |image13.png| image:: _images/image13.png
   :width: 7.5in
   :height: 4.47917in
.. |image14.png| image:: _images/image14.png
   :width: 7.5in
   :height: 4.54167in
.. |image15.png| image:: _images/image15.png
   :width: 7.5in
   :height: 4.47917in
.. |image16.png| image:: _images/image16.png
   :width: 7.5in
   :height: 4.47917in
