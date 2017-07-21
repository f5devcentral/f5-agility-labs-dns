DNSSEC keys
#####################################

Navigate to: **DNS  ››  Delivery : Keys : DNSSEC Key List**

.. image:: /_static/class2/dnssec-keys-create.png

Create zone signing key according the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, example.com_zsk
   Type, Zone Signing Key
   Key Management, Manual
   Certificate, default.crt
   Private Key, default.key

.. image:: /_static/class2/dnssec-zsk.png

Create key signing key according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, example.com_ksk
   Type, Zone Signing Key
   Key Management, “Manual
   Certificate, default.crt
   Private Key, default.key

.. image:: /_static/class2/dnssec-ksk.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/dnssec_key/create.jsp

TMSH commands for Zone Signing key creation:

.. admonition:: TMSH

 tmsh create ltm dns dnssec key example.com_zsk key-type zsk certificate-file default.crt key-file default.key

TMSH commands for Key Signing key creation:

.. admonition:: TMSH

 tmsh create ltm dns dnssec key example.com_ksk key-type ksk certificate-file default.crt key-file default.key


