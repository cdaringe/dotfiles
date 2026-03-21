# git
alias bumpci="git commit --allow-empty -m 'chore: bump ci'"
alias gs="git status"
alias gpm="git pull origin main"
alias gp="git pull"
alias gprf="git pull --rebase=false"
alias pushhead="git push origin HEAD"
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

function git_editor_vscode() {
  git config --global core.editor "code --wait"
}

function gitfsmonitor() {
  git config core.fsmonitor true
  git config core.untrackedcache true
}
alias gitmonorepo=gitfsmonitor
