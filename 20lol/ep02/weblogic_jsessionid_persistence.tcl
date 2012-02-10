when HTTP_REQUEST {    
   if { [HTTP::cookie exists "JSessionID"] } {    
      persist uie [HTTP::cookie "JSessionID"]    
   } else {    
      set jsess [findstr [HTTP::uri] "JSessionID" 11 ";"]    
      if { $jsess != "" } {    
         persist uie $jsess    
      }    
   }    
}    

when HTTP_RESPONSE {    
   if { [HTTP::cookie exists "JSessionID"] } {    
      persist add uie [HTTP::cookie "JSessionID"]   
   }    
}
