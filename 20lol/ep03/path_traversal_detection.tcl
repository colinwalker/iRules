when RULE_INIT {
   set ::vDebug 1
}
when HTTP_REQUEST {
   if { [HTTP::query] matches_regex {^.*=(\.\.|/)[[A-Za-z0-9./]*]*.*$} } {
   if { $::vDebug } {
      log local0. "Triggered by IP [IP::client_addr] with URI [HTTP::uri]"
   }
   reject
   }
}
