Getting Started
---------------


Please follow the instructions provided by the instructor to start your
lab and access your jump host.

.. NOTE::
	 All work for this lab will be performed exclusively from the Linux
	 jumphost. No installation or interaction with your local system is
	 required.

Lab Topology
~~~~~~~~~~~~


The following components have been included in your lab environment:

- 2 x F5 BIG-IP VE (v14.0) DNS GSLB engines
- 1 x F5 BIG-IP VE (v13.1) central Router
- 1 x Linux server (ubuntu)
- 1 x Linux Jumphost

Lab Components
^^^^^^^^^^^^^^


The following table lists VLANS, IP Addresses and Credentials for all
components:

.. list-table::
    :widths: 20 40 40
    :header-rows: 1
    :stub-columns: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - bigip-dc1
      - - **Management:** 10.0.1.245
        - **External:** 10.1.0.245
      - ``admin``/``f5edns0``
    * - bigip-dc2
      - - **Management:** 10.0.1.246
        - **External:** 10.2.0.245
      - ``admin``/``f5edns0``
    * - bigip-router
      - - **Management:** 10.0.1.240
      - ``admin``/``f5edns0``
    * - Linux Jumphost
      - - **Management:** 10.0.1.50
      - ``ubuntu``/``supernetops``
    * - ubuntu server
      - - **Management:** 10.0.1.253
      - ``ubuntu``/``supernetops``

Follow these steps to get your lab started:

#. Open a browser and visit http://training.f5agility.com
#. Enter your class number (instructor will provide this) and your student number.
#. You should now be seeing the class portal and can now access the RDP and lab resrouces.

..  image:: /_static/agility_site.png
..  image:: /_static/class_page.png



To start your lab you will want to log into the linux jumpbox.  
From this you can then do all of the exercises in the lab.
To log into the jump box for the lab start your session and access the jumpbox via RDP.
Once the RDP window is open then just click to log in the "supernetops" user.  
You should not need a password.

..  image:: /_static/rdp_jumpbox.png
