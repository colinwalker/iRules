when HTTP_REQUEST {
    if { [string tolower [HTTP::host]] equals "www.example.com" && [HTTP::path] eq "/" }{
        # Parse the client IP from the CDN header
        set client_ip [HTTP::header value "Client-IP"]
        if { $client_ip eq "" }{
            # The header was empty/did not exist, so use the actual client IP
            set client_ip [IP::client_addr]
        }
        set country [string tolower [whereis $client_ip abbrev]]
        switch $country {
            "af" -
            "bh" -
            "ye" { HTTP::redirect "http://www.example.com/home-${country}" } 
            default {
                # Redirect all others
                HTTP::redirect "http://www.example.com/home"
            }
        }
    } else {
        pool example_web_pool
    }
}
