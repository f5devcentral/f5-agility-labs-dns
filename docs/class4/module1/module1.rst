Module – EDNS0 and client subnet 
=============================================

EDNS0 client subnet - RFC 7871

Problem: With the GSLB solution from f5 it is possible to use DNS to determine the geographical
location of the user. We can't use the IP address of the client for this, because it is masked
by the DNS resolver, and so the dns engine uses the IP address of the DNS resolver instead.
In case of the Google DNS or OpenDNS servers, for many end users those servers are not close to them,
simply because these providers don't have servers in every country and every ISP's network.
For example, OpenDNS does not have DNS servers in South-America. Someone in Brazil using OpenDNS
will likely hit their resolver in Florida. The F5 will then think the user is in Florida and as a
result it will serve content to the user from a server far away (Florida, not Brazil)
resulting in a slow, high latency experience.

Solution: To mitigate the problem of DNS based geo-targetting, Google proposed a technical solution 
to the issue in an IETF draft Client subnet information in DNS requests. This is an experimental DNS 
extension that allows DNS resolvers to pass the client's IP address (or part of) to compatible 
authoritative DNS servers. The F5 DNS server can then use this information to better determine 
where the end user is. Google DNS and OpenDNS implemented this solution as part of the Global 
Internet Speedup initiative in August 2011.

The drawback is the experimental nature of the spec and limited support in existing DNS server software. 
Only OpenDNS and Google Public DNS seems to support it on the resolver side, but NOW with v14 of TMOS 
F5’s DNS GSLB solution can use the Client-subnet options for decision making! 


.. toctree::
   :maxdepth: 1
   :glob:

   lab*