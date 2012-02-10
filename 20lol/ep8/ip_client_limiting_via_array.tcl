when RULE_INIT { 
  array set connections { } 
}

when CLIENT_ACCEPTED { 
  if { [info exists ::connections([IP::client_addr])] } { 
    if { [incr ::connections([IP::client_addr])] > 1000 } { 
      reject 
    } 
  } else { 
    set ::connections([IP::client_addr]) 1 
  } 
}

when CLIENT_CLOSED { 
  if { [incr ::connections([IP::client_addr]) -1] <= 0 } { 
     unset ::connections([IP::client_addr]) 
  } 
}
