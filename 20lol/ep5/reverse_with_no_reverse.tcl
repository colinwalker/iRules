   # Set a test cert string 
   set client_cert_orig {CN=LN.FN.027060322604,OU=CONTRACTOR,OU=PKI,OU=PoP,O=T.Z. Corp,C=TZ} 
   log local0. "\$client_cert_orig: $client_cert_orig"

   # Split the cert string into a list 
   set client_cert_list [split $client_cert_orig ","] 
   log local0. "\$client_cert_list: $client_cert_list"

   # Save the length of the list 
   set i [llength $client_cert_list]

   # Reset the value of a new string to save the client cert 
   set client_cert ""

   # Loop through the list 
   while {$i > 0}{

      # Append the current list item to the string with a forward slash as the delineator 
      append client_cert /[lindex $client_cert_list [incr i -1]] 
      log local0. "\$client_cert: $client_cert" 
   }
