 when HTTP_REQUEST { 
   switch -glob [string tolower [HTTP::uri] { 
     "*service" { 
       HTTP::uri "/myservice" 
     } 
   } 
 } 
