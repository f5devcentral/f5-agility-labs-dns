=====================
EDNS0
=====================

Configure the F5 to use the edns0 field

https://devcentral.f5.com/wiki/iRules.DNS__edns0.ashx?lc=1

.. code-block:: tcl

when DNS_REQUEST { 
    set ldns [IP::client_addr] 
    log local0. "LDNS LOC: $ldns [whereis $ldns]"
   
    if { [DNS::edns0 exists] &! [catch { DNS::edns0 subnet address }] } { 
        set gtm_ecs_address [DNS::edns0 subnet address] 
        set gtm_ecs_source [DNS::edns0 subnet source] 
        set gtm_ecs_scope [DNS::edns0 subnet scope] 
        set ldns  $gtm_ecs_address 
        log local0. "ECS LOC: $gtm_ecs_address [whereis $ldns]" 
    }
   
    log local0. "Final LDNS: $ldns"
   
    if {[matchregion $ldns "China"]} {
   
        if { [active_members inet-cn.lb.rgsource.com] >= 1 } {
            log local0. "Matched $ldns to region: China"
            pool inet-cn.lb.rgsource.com
        } else {
            log local0. "Matched $ldns to region: China, failover to US"
            pool inet-us.lb.rgsource.com
        }
    } elseif { [matchregion $ldns "Europe"]} {
    } elseif { [matchregion $ldns "Asia"]} {
   
    } else {
        log local0. "Matched $ldns to region: Default"
        pool inet-us.lb.rgsource.com
    }
}
