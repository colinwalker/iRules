when CLIENT_ACCEPTED  {
  if { [matchclass [IP::client_addr] equals $::trustedAddresses] }{
    #Uncomment the line below to turn on logging.
    #log local0.  "Valid client IP: [IP::client_addr] - forwarding traffic"
    forward
  } else {
    #Uncomment the line below to turn on logging.
    #log local0. "Invalid client IP: [IP::client_addr] - discarding"
    discard
  }
}
