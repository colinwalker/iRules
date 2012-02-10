when HTTP_REQUEST { 
  set nocompress 0 
  log local0. "comp enabled default " 
  if {[matchclass [string tolower [HTTP::uri]] ends_with $::ok_extension] or [matchclass [string tolower [HTTP::uri]] contains $::compress_dir ] and not [matchclass [IP::remote_addr] equals $::no_compress_ip ] } { 
    set nocompress 0 
    log local0. "setted 0 for ok_extension or compress_dir or ip [IP::remote_addr]" 
  } elseif {[matchclass [string tolower [HTTP::uri]] ends_with $::no_extension] or [matchclass [string tolower [HTTP::uri]] contains $::no_compress_dir ] or [matchclass [IP::remote_addr] equals $::no_compress_ip ] } { 
    set nocompress 1 
    log local0. "setted 1 for no_extension or no_compress_dir or your ip [IP::remote_addr]" 
  } 
}
