# git
alias bumpci="git commit --allow-empty -m 'chore: bump ci'"
alias gs="git status"
alias gpm="git pull origin main"
alias gpum="git pull upstream main"
alias gp="git pull"
alias gprf="git pull --rebase=false"
alias pushhead="git push origin HEAD"
alias gpum="git push --set-upstream origin main"
alias gph="git push origin HEAD"
alias gl="git log --date=local"
alias gbl="git branch --list"
alias gba="git branch --list -a"
function gfa() {
  git fetch --all || true
  git remote prune origin
}
alias gc="git checkout"
alias gcm='git checkout main'
alias gcn='git checkout next'
alias gmom='gfa && git merge origin/main'
alias gmon='gfa && git merge origin/next'
alias gfmom=gmom
alias gfrom="gfa && git reset --hard origin/main"
alias gfron="gfa && git reset --hard origin/next"
alias gd='git diff --ignore-space-change --ignore-all-space'
alias gpurgebranches="confirm 'Purge all non-current git branches?' && git branch --list | trim_line | grep -v '^main' | grep -v \* | xargs git branch -D"
alias git-config-cdaringe="git config --global user.name cdaringe && git config --global user.email christopher.dieringer@gmail.com && git config --global core.editor vim && git config --global push.default current"
alias gtrack='git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)'

function git_upload_ssh_key() {
  read -p "Enter github email : " email
  echo "Using email $email"
  if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -C "$email"
    ssh-add ~/.ssh/id_rsa
  fi
  pub=$(cat ~/.ssh/id_rsa.pub)
  read -p "Enter github username: " githubuser
  echo "Using username $githubuser"
  read -s -p "Enter github password for user $githubuser: " githubpass
  echo
  read -p "Enter github OTP: " otp
  echo "Using otp $otp"
  echo
  confirm
  curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"$(hostname)\",\"key\":\"$pub\"}" --header "x-github-otp: $otp" https://api.github.com/user/keys
}

function git_editor_vscode() {
  git config --global core.editor "code --wait"
}

function git_update_author_old_to_new_bad_email_good_email_username_3argstotal() {
  # git filter-branch -f --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "$1" ]; then
  #    GIT_AUTHOR_EMAIL="$2";
  #    GIT_AUTHOR_NAME="$3";
  #    GIT_COMMITTER_EMAIL=$2;
  #    GIT_COMMITTER_NAME="$3"; fi' -- HEAD~3..HEAD
  git filter-branch --env-filter '

OLD_EMAIL="..."
CORRECT_NAME="cdaringe"
CORRECT_EMAIL="cdaringe@..."

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' -- HEAD~3..HEAD
}

function gitfsmonitor() {
  git config core.fsmonitor true
  git config core.untrackedcache true
}
alias gitmonorepo=gitfsmonitor
