when HTTP_REQUEST { 
  set ID [findstr [HTTP::cookie "CookieX"] "Cookie" 10 ";"] 
  set my_uri [string tolower [HTTP::uri]] 
  log local0.info "ID is $ID default pool is [LB::server pool] URI is $my_uri" 
  if {($ID equals "")} { 
    log local0.info "sending user to pool [LB::server pool]" 
    pool [LB::server pool] 
  } elseif { ($my_uri ends_with "/attachmentshare/upload.aspx") and not ($ID equals "")} { 
    log local0.info "URI contains $my_uri sending user to pool AVPool$ID" 
    pool AVG$ID 
    snatpool SNAT$ID 
  } else { 
    log local0.info "Cookie found sending user to Pool Pool$ID" 
    pool Pool$ID 
  } 
}
