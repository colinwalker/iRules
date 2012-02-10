when HTTP_REQUEST { 
  if { [TCP::local_port] == 80 } { 
    log local0. "connecting on HTTP server" 
    if { [matchclass [HTTP::uri] starts_with $::secure_uris] } { 
      HTTP::redirect "http://[HTTP::host][HTTP::uri]" 
    } 
  } 
}
