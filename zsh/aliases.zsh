alias reload!='. ~/.zshrc'

alias dir='ls -alFh'

# quick python server
function server() {
  local port="${1:-8080}"
  python -m SimpleHTTPServer "$port"
  open "http://localhost:${port}/"
}

alias betty="~/.dotfiles/betty/main.rb"
