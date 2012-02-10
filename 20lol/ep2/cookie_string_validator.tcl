when RULE_INIT { 
   set ::cookie_to_validate "my_cookie" 
   set ::cookie_validation_debug 1 
   set ::allowed_chars_cookie_value {%[-a-zA-Z0-9_]} 
}

when HTTP_REQUEST { 
   if {[string length [HTTP::cookie value $::cookie_to_validate]]}{ 
      if {[HTTP::cookie value $::cookie_to_validate] eq [scan [HTTP::cookie value $::cookie_to_validate] $::allowed_chars_cookie_value]}{ 
         if {$::cookie_validation_debug} { 
           log local0. "Received a request from [IP::client_addr] with legal cookie value: [HTTP::cookie value $::cookie_to_validate]"} 
      } else { 
         if {$::cookie_validation_debug}{ 
         set len [string length [scan [HTTP::cookie value $::cookie_to_validate] $::allowed_chars_cookie_value]] 
         log local0. "Received a request from [IP::client_addr] with illegal cookie value: [HTTP::cookie value $::cookie_to_validate], \ 
            char: [string range [HTTP::cookie value $::cookie_to_validate] $len $len]"} 
      } 
   } 
}
