when HTTP_REQUEST {
  if { [HTTP::uri] starts_with "/clone_me" } {
    pool real_pool
    clone pool clone_pool
  } else {
    pool real_pool
  }
}
