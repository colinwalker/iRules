when CLIENT_ACCEPTED { 
  TCP::collect 
} 

when CLIENT_DATA {  
  TCP::collect 25  
  binary scan [TCP::payload] x11a* msrdp  
  if { [string equal -nocase -length 17 $msrdp "cookie: mstshash="] } {  
    set msrdp [string range $msrdp 17 end]  
    set len [string first "\n" $msrdp]  
    if { $len == -1 } { TCP::collect }  
    if { $msrdp contains "@" } {  
      if { $len > 5 } {  
        incr len -1  
        persist uie [getfield $msrdp "@" 1] 10800 
      }  
    } else { persist uie $msrdp 10800 }  
  }  
  TCP::release  
}
