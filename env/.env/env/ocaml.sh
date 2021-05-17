# opam configuration
test -r ~/.opam/opam-init/init.sh && . ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
load-opam-dune() {
  if [[ -f dune && -r dune ]]; then
    echo "🐪 detected. attemptin to load local switch"
    eval $(opam env --switch=. --set-switch)
  fi
}
