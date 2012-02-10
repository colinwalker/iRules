when HTTP_REQUEST { 
  switch [HTTP::uri] {
    "/app/DentegraPortal/TransEDI" -
    "/app/DeltaCarePortal/TransEDI" -
    "/app/B2BEnt/TransEDI" -
    "/app/B2BPMI/TransEDI" {
      log "Incoming uri - [HTTP::uri] being translated to /b2b/transportServlet/TransEDI"
      HTTP::uri "/b2b/transportServlet/TransEDI"
    }
  }
}
