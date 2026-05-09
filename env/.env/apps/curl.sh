# shellcheck shell=bash
function headcurl() {
  curl -sSkv -o /dev/null "$@" 2>&1
}
alias curlhead="headcurl"
