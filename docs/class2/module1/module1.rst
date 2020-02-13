Transparent Cache
#####################################

.. toctree::
   :hidden:
   :maxdepth: 2
   :glob:

   lab*


In this module we will implement all the configuration objects required to for a transparent cache.

Enabling a transparent cache offloads the back end DNS servers from every query freeing resources on the servers. 


.. image:: /class2/media/transparent_cache.png


Log into *(bigip01)* in the using either the TMUI or ssh interface with credentials u:**admin** p:**agility2020**

Navigate to **DNS  ››  Caches ›› Cache List**

And click the *Create* button to create a transparent cache with the following settings: 


.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   "Name", "transparent_cache"
   "Resolver Type", "Transparent"

.. image:: /class2/media/cache_transparent.png
  :align: center
  :scale: 50


.. admonition:: TMSH

   tmsh create ltm dns cache transparent transparent_cache


