Orientation
==================

#. Open the command prompt on the Windows jumpbox and execute the following command:

   **dig www.example.com**. Examine the output, and observe that an A record exists.

   .. image:: /_static/dig_www.example.com_static.png

#. RDP to the domain controller using: **EXAMPLE\\user**, password **Agility1**.

   sigh..... it takes foreveor to log into the Domain Controller.

   Be patient, it may take up to three minutes at the first login.

   **Start** –> **Remote Desktop Connection** –> **10.1.70.200**.

   .. image:: /_static/start-rdp-dc01-1.png

   .. image:: /_static/logon_screen.png

#. Click on **Server Manager**, and in the top right corner choose **Tools** and then **DNS**.

   .. image:: /_static/AD_tools-1.png

#. Double click on **EXAMPLE.COM** and examine DNS records.

   .. image:: /_static/DNS_Manager.png

   .. image:: /_static/www_properties.png

#. Connect to https://bigip1.site1.example.com and list the virtual server (**203.0.113.9**).
   Use Internet Explorer Browser on the jumpbox to log in via the GUI, or use Putty for SSH to get a shell.

GUI username = **admin/admin**

CLI username = **root/default**

   .. image:: /_static/bigip1.site1_virtuals.png

#. Connect to https://bigip1.site2.example.com and list the virtual servers (**198.51.100.41**).
   Use Internet Explorer Browser on the jumpbox to log in via the GUI, or use Putty for SSH to get a shell.

GUI username = **admin/admin**

CLI username = **root/default**

   .. image:: /_static/bigip1.site2_virtuals.png

