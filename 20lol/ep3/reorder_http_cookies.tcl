when HTTP_REQUEST {
  if { [HTTP::cookie exists "cookie-name"] } {
    set cookie_s [HTTP::cookie "cookie-name"]
    HTTP::cookie remove "cookie-name"
    set cookie_a [HTTP::header cookie]
    HTTP::header replace "cookie" "$cookie_a; WLSID=$cookie_s"
  }
}
