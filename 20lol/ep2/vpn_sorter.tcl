when CLIENT_ACCEPTED { 
  if {[IP::protocol] == 47 || [TCP::local_port] == 1723} { 
    # GRE used by MS PPTP server, TCP control channel 
    pool ms_pptp 
  } elseif {[IP::protocol] == 50 || [IP::protocol] == 51 || [UDP::local_port] == 500}  { 
    # AH and ESP used by IPSec, IKE used by IPSec 
    pool ipsec_pool 
  } elseif {[IP::protocol] == 115} { 
    pool l2tp_pool 
    # L2TP Protocol server 
  } 
}
