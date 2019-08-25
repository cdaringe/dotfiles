ballervim () {
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
  cd ~/.vim/bundle && \
  rm -rf vim-colors-solarized && git clone git://github.com/altercation/vim-colors-solarized.git && \
  rm -rf syntastic && git clone https://github.com/scrooloose/syntastic.git && \
  rm -rf vdebug && git clone git@github.com:joonty/vdebug.git
}


alias vimrc="$EDITOR ~/.vimrc"
