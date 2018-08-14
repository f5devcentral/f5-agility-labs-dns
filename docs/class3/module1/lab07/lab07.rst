Delegation
=================================

Delegate a subdomain of example.com to the BIG-IP DNS. Delegation is a means to 'defer' or assign management of a portion of your DNS namespace to another DNS server. When the DNS server receives a query for the delegated subdomain it will either recursively resolve the CNAME target, or respond with a referral.

|delegation_link|

.. |delegation_link| raw:: html

   <a href="https://support.f5.com/kb/en-us/products/big-ip_gtm/manuals/product/gtm-implementations-11-4-0/4.html" target="_blank">More information on DNS Delegation</a>

Login to the local DNS server (this should already be open) from the jumpbox, and open the DNS management UI:

.. image:: ../../media/dc01_dns_tools.png

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   task*
