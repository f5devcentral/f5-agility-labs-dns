Results
=====================

Now lets test the new service we created. The related configuration on the BIG-IP LTM and on the Microsoft DNS server are already complete for you. Open up FileZilla from your client workstation and connect to the DNS service ftp.example.com. This is a CNAME for ftp.gslb.example.com.

.. note::  **Use FTP credentials admin/admin**

.. image:: /_static/API3-a.png
   :align: left

You've just successfully created a new highly available service on BIG-IP DNS all with only a few very simple API commands.
