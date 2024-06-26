Sync Group
==================================

After the BIG-IP DNS server in datacenter B is joined to the sync group, administrators may make changes to either F5 DNS server.

Changes will be automatically replicated across all F5 DNS servers.

Launch WEB SHELL and log in to dns.siteb

.. image:: /_static/class1/dns_siteb_web_shell.png
   :width: 600

Run the following command: Enter the password "F5demo!!" when prompted.

.. admonition:: TMSH

   gtm_add 10.1.10.100

The 'gtm_add' command will pull the configuration from the source device (dns.site1 - 10.1.10.100) overwriting any existing GSLB configuration on the system where the command is run.  Make sure to read the prompts and warnings to confirm that the source/destination is correct.

.. image:: /_static/class1/gtm_add.png
   :width: 700

Select "y" to allow dns.siteb to join the GSLB mesh.

Type 'yes' if prompted to connect.  This will add the endpoint's SSH key to the known_hosts file

.. image:: /_static/class1/gtm_add_connect_prompt.png
   :width: 700

Review the command output,  You should see the SSL certs being shared, the config backup, the GTM config pull, the DNS/Zone pull and service restarts.  Check for any errors or warnings.  There shouldn't be any errors or warnings in the lab environment but you may have connectivity/routing related errors outside of the lab - port 22, 443 or 4353 (iQuery port) being blocked by a firewall between F5 DNS systems is common.  If the destination DNS device is not in the GSLB server list of the source DNS device, you will have errors with gtm_add as well.

.. image:: /_static/class1/gtm_add_finished.png
   :width: 700

