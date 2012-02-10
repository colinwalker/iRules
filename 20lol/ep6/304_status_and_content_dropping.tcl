when HTTP_RESPONSE { 
  if {[catch {HTTP::status} status] or $status == ""} { 
    set status "-" 
    HTTP::close 
  } elseif {$status >= 400} { 
    HTTP::close 
  } elseif {$status == 304} { 
    catch {unset hdrs} 
    if [catch {HTTP::header names} headerNames] { 
      lappend hdrs X-Error "noHeaderSent" 
    } else { 
      foreach hdr $headerNames { 
        if { ! [catch "HTTP::header value $hdr" vals]} { 
          lappend hdrs $hdr "$vals" 
        } 
      } 
    } 
    if [catch HTTP::respond 304 $hdrs err] { log local0. "RESPOND_304_ERROR: $ err" } 
  } 
}
