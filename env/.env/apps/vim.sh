ballervim () {
  local old=$PWD
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
  cd ~/.vim/bundle && \
  rm -rf vim-colors-solarized && git clone https://github.com/altercation/vim-colors-solarized.git && \
  mkdir -p ../colors && mv vim-colors-solarized/colors/* ../colors/ && \
  rm -rf syntastic && git clone https://github.com/scrooloose/syntastic.git && \
  rm -rf vdebug && git clone https://github.com/joonty/vdebug.git
  cd $old
}


alias vimrc="$EDITOR ~/.vimrc"
