Create an iRule
############################

Navigate to: **DNS  ››  Delivery : iRules : iRules List**

.. image:: /_static/class2/irule-new.png 

https://router01.branch01.example.com/tmui/Control/jspmap/tmui/dns/rule/list.jsp

Create new iRule, copy the content below and paste it.

.. csv-table::
   :header: "Setting", "Value"
   :widths: 15, 15

   Name, DNS-query-filtering  

.. code-block:: tcl
 
   when RULE_INIT {
     # Set categories to block for DNS hosts
     set static::blocked_categories {
       /Common/Bot_Networks
       /Common/Spyware
       /Common/Malicious_Web_Sites
       /Common/Adult_Content
       /Common/Sex
     }
 
 
     # CONFIGURATION
     # Check all requests by default
     set static::request_check 1
     # If the category returns as blocked, return NXDOMAIN (1)
     # Otherwise if (0), return a statically defined IP address
     set static::request_return_nxdomain 0
     set static::request_redirect_to "10.1.71.21"
     # Toggle for debug logs
     set static::request_debug 1
   }
 
 
   when DNS_REQUEST {
     if { $static::request_check } {
       set lookup_category [getfield [CATEGORY::lookup "http://[DNS::question name]"] " " 1]
       if { [lsearch -exact $static::blocked_categories $lookup_category] >= 1 } {
         if { $static::request_debug } {
            log local0. "BLOCKED: Category $lookup_category matching [DNS::question name] is filtered."
         }
         DNS::answer clear
         if { $static::request_return_nxdomain } {
            DNS::header opcode QUERY
            DNS::header rcode NXDOMAIN
         } else {
            if { [DNS::question type] equals "A" } {
               DNS::answer insert "[DNS::question name]. 111 [DNS::question class] [DNS::question type] $static::request_redirect_to"
            }
         }
         DNS::return
    } else {
      if { $static::request_debug } {
         log local0. "Category $lookup_category matching [DNS::question name] is not filtered"
         }
       }
     }
   }
 
TMSH commands for router01.branch01 (Make sure you use text editor to copy content above and paste it)

.. admonition:: TMSH

   tmsh create ltm rule DNS-query-filtering


