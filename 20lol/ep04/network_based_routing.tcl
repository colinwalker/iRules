when CLIENT_ACCEPTED {
   if { [matchclass [IP::remote_addr] equals $::my_networks_class] } {
      log local0. "[IP::client_addr]:[TCP::client_port] matched \$::my_networks_class: $::my_networks_class"
      pool Visionware_web28
   } else {
      log local0. "[IP::client_addr]:[TCP::client_port] didn't match \$::my_networks_class: $::my_networks_class"
      pool Visionware_web27
   }
}
