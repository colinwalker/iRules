when HTTP_RESPONSE { 
  if { [HTTP::header exists "jsessionid"] } { 
    set jsess_resp [findstr [HTTP::header "jsessionid"] "!" 1 "!"] 
    if { $jsess_resp != "" } { 
      persist add uie $jsess_resp 
    } 
  } 
}
