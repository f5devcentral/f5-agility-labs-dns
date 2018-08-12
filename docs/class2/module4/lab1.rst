Zone Signing Key
#####################################

Navigate to: **DNS  ››  Delivery : Keys : DNSSEC Key List**

.. image:: /class2/media/dnssec-keys-create.png

Create zone signing key according the following table:

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, example.com_zsk
   Type, Zone Signing Key
   Key Management, Manual
   Certificate, default.crt
   Private Key, default.key

.. image:: /class2/media/mod4lab1-zsk.png

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/dnssec_key/create.jsp

.. admonition:: TMSH

 tmsh create ltm dns dnssec key example.com_zsk key-type zsk certificate-file default.crt key-file default.key


