when HTTP_REQUEST { 
  # Save the URI 
  set uri [HTTP::uri] 
}
when HTTP_RESPONSE { 
  if {([HTTP::header Cache-Control] eq "private, max-age=3600") and ($uri ends_with “.html”)} { 
    HTTP::header replace Cache-Control "public, max-age=3600" 
  } 
}
