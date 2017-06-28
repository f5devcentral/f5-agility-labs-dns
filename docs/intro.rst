==================================
Lab Environment
==================================

Connect to a Windows jumpbox in the cloud. From the Windows jumpbox students will configure F5 devices across two datacenters and a branch office. The Windows jumpbox is in the branch office along with an Active Directory domain controller.

.. figure:: /_static/Agility_DNS.png

###########################
Ravello Cloud
###########################

The lab environment is hosted in cloud environments managed by Ravello Systems. Login to the Ravello training portal using a browser.

Current Ravello Blueprint Version is: AGILITY_DNS_201706281515

**Ask an instructor for the login information**

**- TODO insert updated Ravello screenshots**

Once logged in, you will find the URL for your windows jumpbox.

.. figure:: /_static/ravello.png

NOTE: All the VMs should be in a STARTED state.

Copy the FQDN located under the DNS section.

Open a remote desktop client on your workstation and connect to the jumpbox.

Username: **user**
Password: **Agility1**

.. figure:: /_static/rdp_to_jumpbox.jpeg

##################
IPv4
##################

Management IP Addresses:

.. csv-table::
   :header: "Host", "Managment"
   :widths: 15, 15
   
   "bigip1.site1", "10.1.10.11"
   "bigip2.site1", "10.1.10.12"
   "gtm1.site1", "10.1.10.13"
   "bigip1.site2", "10.1.10.21"
   "bigip2.site2", "10.1.10.22"
   "gtm1.site2", "10.1.10.23"
   "router01.branch01", "10.1.10.31"

Service IP Addresses:

+--------------------------------+---------------------------------+
| **Site 1**                     | **Site 2**                      |
+================================+=================================+
| www.example.com = 203.0.113.9  | www.example.com = 198.51.100.41 |
+--------------------------------+---------------------------------+
| vpn.example.com = 203.0.113.10 | vpn.example.com = 198.51.100.42 |
+--------------------------------+---------------------------------+

##################
Orientation
##################

#. Open the command prompt on the Windows jumpbox and execute the following command:

   **dig www.example.com**. Examine the output, and observe that an A record exists.

   .. figure:: /_static/dig_www.example.com_static.png

#. Open Internet Explorer and access `www.example.com <https://www.example.com>`__. Note that you accessed a web server in site1.

   **TODO Create content server page and add screenshot**

#. RDP to the domain controller using: **EXAMPLE\\user**, password **Agility1**.

   **Start** –> **Remote Desktop Connection** –> **10.1.70.200**.

   .. figure:: /_static/start-rdp-dco1.png
   .. figure:: /_static/logon_screen.png

#. Click on **Server Manager**, and in the top right corner choose **Tools** and then **DNS**.

   .. figure:: /_static/AD_tools.png

#. Double click on **EXAMPLE.COM** and examine DNS records.

   .. figure:: /_static/DNS_Manager.png

   .. figure:: /_static/www_properties.png

#. Connect to https://bigip1.site1.example.com and list the virtual server (**203.0.113.9**).
   Use Internet Explorer Browser on the jumpbox to log in via the GUI, or use Putty for SSH to get a shell.

GUI username = **admin/admin**

CLI username = **root/default**

   .. figure:: /_static/bigip1.site1_virtuals.png

#. Connect to https://bigip1.site2.example.com and list the virtual servers (**198.51.100.41**).
   Use Internet Explorer Browser on the jumpbox to log in via the GUI, or use Putty for SSH to get a shell.

GUI username = **admin/admin**

CLI username = **root/default**

   .. figure:: /_static/bigip1.site2_virtuals.png

