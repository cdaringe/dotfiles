set nocompatible  " be iMproved, required
" set directory=$HOME/.vim/swapfiles/

filetype off
filetype plugin indent on

"general
set list listchars=tab:>-,trail:.,extends:>,precedes:<

"environment settings
set mouse=a
noremap <LeftDrag> <LeftMouse>
noremap! <LeftDrag> <LeftMouse>

set fileformat=unix
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set number

let g:solarized_termcolors=256
" syntax enable
set background=light
colorscheme solarized

"Key remapping splits with command+arrows
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <D-down> :resize +5<cr>
nnoremap <D-up> :resize -5<cr>
nnoremap <D-right> :vertical resize +5<cr>
:nmap <C-N><C-N> :set invnumber<CR>

:map <C-F2> :echo 'Current time is ' . strftime('%c')<CR>

:%s/\s\+$//e "purge all trailing whitespace
