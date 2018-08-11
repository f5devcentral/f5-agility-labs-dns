Key Signing Key
############################################

Navigate to: **DNS  ››  Delivery : Keys : DNSSEC Key List**

.. image:: /_static/class2/dnssec-keys-create.png

Create a key signing key according to the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, example.com_ksk
   Type, Key Signing Key
   Key Management, Manual
   Certificate, default.crt
   Private Key, default.key

.. image:: /_static/class2/dnssec-ksk.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/dnssec_key/create.jsp


TMSH commands for Key Signing key creation:

.. admonition:: TMSH

 tmsh create ltm dns dnssec key example.com_ksk key-type ksk certificate-file default.crt key-file default.key


