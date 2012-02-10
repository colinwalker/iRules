when HTTP_REQUEST { 
  if {not ([string tolower [HTTP::host]] eq "www.domain.com")}{ 
    HTTP::redirect http://www.domain.com[HTTP::uri] 
  } else { 
    switch -glob [HTTP::path] { 
      "/us*" { 
        pool US_pool 
        log local0. "[IP::client_addr]:[TCP::client_port]: using pool US_pool" 
      } 
      "/au*" { 
        pool AU_pool 
        log local0. "[IP::client_addr]:[TCP::client_port]: using pool AU_pool" 
      } 
      default { 
        pool default_pool 
        log local0. "[IP::client_addr]:[TCP::client_port]: using default pool" 
      } 
    } 
  } 
}
