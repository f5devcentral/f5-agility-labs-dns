Class 2 - Next Generation DNS Services 
======================================================

The lab section for this class will cover the following topics: 

#. Transparent Cache

#. Hidden Master

#. DNSSec

#. Validating Resolver

#. RPZ

#. URL Categorization

The lab environment consists of BIG-IPs along with Linux hosts interacting with DNS Servers. 

The F5 device is directly connected to the internet.


Below is a lab diagram and connectivity information:

.. image:: /class2/media/lab_diagram.png


Lab Components
^^^^^^^^^^^^^^

The following table lists VLANS, IP Addresses and Credentials for all
components:

.. list-table::
    :widths: 20 40 40
    :header-rows: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - bigip
      - - **Management:** 10.1.1.4
        - **External Self:** 10.1.10.10
        - **Internal Self:** 10.1.20.10
      - ``admin``/``agility2020``
    * - Ubuntu Desktop
      - - **Management:** 10.1.1.6
        - **External:** 10.1.10.4
      - ``ubuntu``/``agility2020``
    * - Ubuntu server
      - - **Management:** 10.1.1.5
        - **Internal:** 10.1.20.4
      - ``ubuntu``/``agility2020``

Follow these steps to get your lab started:

 <lab steps for UDF to be put here> 


.. toctree::
   :hidden:
   :numbered:
   :maxdepth: 2
   :glob:

   module*/module*


