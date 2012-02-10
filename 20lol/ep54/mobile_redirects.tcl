when HTTP_REQUEST {
  # Get the index of the last URI directory
  set depth [URI::path [HTTP::uri] depth]

  # Parse the last directory in the path
  set last_dir [URI::path [HTTP::uri] $depth $depth]

  # Parse everything after the last hyphen in the last directory
  set digits [string trimleft [string range $last_dir [expr {[string last - $last_dir]}] end-1] -/]

  log local0. "URI=[HTTP::uri], \$depth=$depth, \$last_dir=$last_dir, \$digits=$digits"

  # Check if we parsed 4 or 6 digits
  switch $digits {
      [0-9][0-9][0-9][0-9] -
      [0-9][0-9][0-9][0-9][0-9][0-9] {
          # Found 4 or 6 digits, send a redirect
          HTTP::redirect "http://m.site.com/test/?gid=$digits"
      }
  }
}
