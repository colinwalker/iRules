when RULE_INIT {
  set ::whichone 0
}
when HTTP_REQUEST {
  switch $::whichone {
    0 {
      HTTP::redirect "http://Server1/blah"
      set ::whichone 1
    }
    default { 
      HTTP::redirect "http://Server2/blah" 
      set ::whichone 0
    }
  }
}
