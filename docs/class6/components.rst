Components
~~~~~~~~~~

The lab consists of the following items:

-  Subnets

   -  Management: 10.1.1.0/24

   -  DNS VIPs: 10.1.10.0/24

   -  DNS Servers: 10.1.20.0/24

-  Hosts

   -  Windows Jump Host

      -  Credentials: user / user

      -  Management IP: 10.1.1.4

   -  Ubuntu Jump Host – for Attacks

      -  Credentials: user / f5agility!

      -  Management IP: 10.1.1.7

      -  External IP: 10.1.10.7

   -  Ubuntu DNS server – “Victim” server

      -  Credentials: user / f5agility!

      -  Management IP: 10.1.1.6

      -  External IP: 10.1.20.6

   -  F5 BIG-IP Proxy:

      -  Credentials: admin / default \| root / default

      -  Management IP: 10.1.1.8

      -  External Subnet IP: 10.1.10.5/24

      -  Internal Subnet IP: 10.1.20.5/24

      -  DNS VIPs

         -  DoT-to-DNS: 10.1.10.6 (TCP/853)

         -  DoH-to-DNS: 10.1.10.6 (TCP/443)

         -  DNS-traditional (TCP/53 and UDP/53)
