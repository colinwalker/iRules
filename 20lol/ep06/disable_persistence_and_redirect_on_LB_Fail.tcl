when HTTP_REQUEST { 
   if { ([HTTP::cookie exists "JSESSIONID"]) and ([active_members [LB::server pool]] > 0) } { 
     persist uie [HTTP::cookie "JSESSIONID"] 
   } 
 } 
  
 when HTTP_RESPONSE { 
   if { ([HTTP::cookie exists "JSESSIONID"]) and ([active_members [LB::server pool]] > 0) } { 
     persist add uie [HTTP::cookie "JSESSIONID"] 
   } 
 } 
  
 when LB_FAILED { 
   if {[active_members [LB::server pool]] == 0 } { 
     LB::detach 
     LB::reselect pool "sorry" 
   } 
 }
