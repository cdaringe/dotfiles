# git
alias bumpci="git commit --allow-empty -m 'fix(pkg): bump ci'"
alias gum="git branch -u origin/master"
alias gs="git status"
alias gpm="git pull origin master"
alias gpush="git push origin $1";
alias gp="git pull"
alias gpum="git push --set-upstream origin master"
alias gph="git push origin HEAD"
alias gl="git log"
alias gbl="git branch --list"
alias gba="git branch --list -a"
alias gc="git checkout"
alias gcm='git checkout master'
alias gd='git diff --ignore-space-change --ignore-all-space'
alias gh="git config --get remote.origin.url"
alias gpurgebranches="confirm 'Purge all non-current git branches?' && git branch --merged | grep -v \* | xargs git branch -D"
alias git-config-cdaringe="git config --global user.name cdaringe && git config --global user.email christopher.dieringer@gmail.com && git config --global core.editor vim && git config --global push.default current"
function git_upload_ssh_key () {
  read -p "Enter github email : " email
  echo "Using email $email"
  if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C "$email"
    ssh-add ~/.ssh/id_rsa
  fi
  pub=`cat ~/.ssh/id_rsa.pub`
  read -p "Enter github username: " githubuser
  echo "Using username $githubuser"
  read -s -p "Enter github password for user $githubuser: " githubpass
  echo
  read -p "Enter github OTP: " otp
  echo "Using otp $otp"
  echo
  confirm
  curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" --header "x-github-otp: $otp" https://api.github.com/user/keys
}