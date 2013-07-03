alias reload!='. ~/.zshrc'

alias dir='ls -alFh'

# quick python server
function server() {
  local port="${1:-8080}"
  open "http://localhost:${port}/"
  python -m SimpleHTTPServer "$port"
}