Components
~~~~~~~~~~

The lab consists of the following items:

-  Subnets

   -  Management: 10.1.1.0/24

   -  DNS VIPs: 10.1.10.0/24

   -  DNS Servers: 10.1.20.0/24

-  Hosts

   -  Windows Jump Host

      -  Credentials: user / f5agility2021

      -  Management IP: 10.1.1.4

   -  Ubuntu Jump Host

      -  Credentials: user / f5agility2021

      -  Management IP: 10.1.1.6

   -  F5 BIG-IP Proxy:

      -  Credentials: admin / f5agility2021 \| root / f5agility2021

      -  Management IP: 10.1.1.5

      -  Client Subnet IP: 10.1.10.10

      -  Server Subnet IP: 10.1.20.10

      -  DNS VIPs

         -  DoT-to-DNS: 10.1.10.100 (TCP/853)

         -  DoH-to-DNS: 10.1.10.100 (TCP/443)

         -  DNS-to-DoT: 10.1.10.101 (TCP/53 and UDP/53)

         -  DNS-to-DoH: 10.1.10.102 (TCP/53)