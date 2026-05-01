function uall () {
  l_pwd=$PWD
  cd ~/dotfiles
  git pull
  echo '[dotfiles] adding dotfiles...'
  git add ~/dotfiles
  echo '[dotfiles] committing...'
  git commit -m 'feat(dotfiles): enhancing the radness'
  echo '[dotfiles] merging...'
  git pull --rebase=false origin master --verbose
  echo '[dotfiles] pushing...'
  git push origin master --verbose
  echo '[dotfiles] patches submitted successfully!'
  stow env
  cd $l_pwd
  source ~/.bash_profile
}
