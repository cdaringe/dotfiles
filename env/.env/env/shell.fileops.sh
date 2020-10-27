alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias untar="tar -xvf $1"

function random-filename () {
  echo $(random-string 15).$(random-string 3)
}
function encrypt-file () {
  local DEST=$(random-filename);
  eval "gpg --output $DEST --symmetric --cipher-algo AES256 $1";
  echo "file written to $DEST";
}
function decrypt-file () {
  gpg --output $2 --decrypt $1
}

function dir-size () {
  du -L -h -d 1 $1 | gsort -h;
}

# rmate
alias installrmate="sudo curl -Lo /usr/local/bin/rmate https://raw.github.com/textmate/rmate/master/bin/rmate && sudo chmod a+x /usr/local/bin/rmate"
# to connect, ssh -R 52698:localhost:52698 user@yourServer. or, .ssh/config specify this
alias rmateclog="echo 'Kill process using 52698 (kill ###)'; sudo netstat -antpl  | grep 52698"
