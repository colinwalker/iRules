when HTTP_REQUEST { 
   if { [string tolower [HTTP::path]] ends_with "/_grid/print/print_data.aspx" \

   and (not ([IP::addr [IP::client_addr]/8 equals 10.0.0.0]))} { 
      HTTP::redirect "http://google.com" 
   } 
}
