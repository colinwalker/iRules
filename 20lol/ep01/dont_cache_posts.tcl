when HTTP_REQUEST {
  if { [HTTP::method] equals "POST" } {
    CACHE::disable
  } else {
    CACHE::enable
  }
} 
