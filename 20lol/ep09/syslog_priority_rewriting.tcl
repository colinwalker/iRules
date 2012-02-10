when CLIENT_DATA { 
  set pri [regexp -inline {<\d+>} [UDP::payload] ] 
  set newPri [expr ( ($pri - (($pri / 6) * 8) ) ) ] 
  regsub $pri [UDP::payload] $newPri newPayload 
  UDP::payload replace 0 [UDP::payload length] $newPayload 
}
