Sub Domain
=================================

Configure the delegation of gslb.example.com to ns1 and ns2, the A records which were created in the previous step.

#. Expand "Forward Lookup Zones", and right click on "EXAMPLE.com

   .. image:: /_static/class1/dc01_new_delegation.png
      :align: left

#. Create the "gslb" subdomain.

   .. image:: /_static/class1/dc01_new_delegation_create_gslb.png
      :align: left

#. Step through the Delegation Wizard. Add "ns1.example.com - 203.0.113.8"

   .. image:: /_static/class2/dc01_new_delegate_add_ns1.png
      :align: left

   Repeat to add ns2.example.com

   .. image:: /_static/class1/dc01_new_delegation_ns1ns2.png
      :align: left

#. Also add "ns2.example.com - 198.51.100.40"

   .. image:: /_static/class1/dc01_new_delegation_ns1ns2_create.png
      :align: left

#. Make sure both ns1.example.com and ns2.example.com are added

   .. image:: /_static/class1/dc01_new_delegation_ns1ns2_create_finish.png
      :align: left

#. Click "Finish"

   .. image:: /_static/class1/dc01_new_delegation_create_gslb_finish.png
      :align: left
