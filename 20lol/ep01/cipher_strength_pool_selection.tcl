when HTTP_REQUEST {
  log local0. "[IP::remote_addr]: SSL cipher strength is [SSL::cipher bits]"
  if { [SSL::cipher bits] < 128 }{
    pool weak_encryption_pool
  } else {
    pool strong_encryption_pool
  }
}
