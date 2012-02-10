when HTTP_REQUEST { 
   # Save the requested host header value for reference in the response 
   set host [HTTP::host] 
} 
when HTTP_RESPONSE {

   # Check if this is a redirect (30x response status) 
   if {[HTTP::is_redirect]}{

      # Replace the http://host with https://host in the Location header 
      HTTP::header replace Location [string map -nocase {http://$host https://$host} [HTTP::header value Location]] 
   } 
}
