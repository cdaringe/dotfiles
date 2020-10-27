function uall () {
  l_pwd=$PWD
  cd ~/dotfiles
  echo '[dotfiles] adding dotfiles...'
  git add ~/dotfiles
  echo '[dotfiles] committing...'
  git commit -m 'feat(dotfiles): enhancing the radness'
  echo '[dotfiles] merging...'
  git pull --rebase=false origin master
  echo '[dotfiles] pushing...'
  git push origin master
  echo '[dotfiles] patches submitted successfully!'
  stow env
  cd $l_pwd
  sourceme
}
