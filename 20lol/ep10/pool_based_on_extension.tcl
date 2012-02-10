when HTTP_REQUEST {
  switch -glob [HTTP::path] {
    "*.jpg"        -
    "*.gif"        -
    "*.png"        { pool image_pool }
    "*.pdf"        { pool pdf_pool }
    default        { pool web_pool }
  }
}
