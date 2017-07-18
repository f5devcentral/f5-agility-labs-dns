Class 2 - Security
=============================

The lab is contained in a remote location where F5 BIG-IP is the default gateway for internal corporate networks.

The F5 is pre-configured as a firewall device sitting on the ISP vlans and internal vlans.

Students will migrate the existing DNS topology where two Active Directory servers are handling local DNS.

The F5 will intercept DNS queries which would normally be routed directely to the Domain Controller IP.

The BIG-IP will intercept all DNS requests and perform DNS security.

Students will learn how to implement the following concepts and learn how to migrate to a secure DNS infrastructure.

Windows workstations are configured to use the local "Active Directory" DNS servers for resolution.

The Windows domain controller has a DNS server role installed and performs recursive DNS services.

.. toctree::
   :hidden:
   :numbered:
   :maxdepth: 2
   :glob:

   module*/module*

.. image:: /_static/class2/class2_overview.png

