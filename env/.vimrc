set nocompatible  " be iMproved, required
" set directory=$HOME/.vim/swapfiles/

"pathogen - enable easy install of modules in ~/.vim/bundles dir
execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}', 'plugin/{}')
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
set background=light
syntax on
" colorscheme solarized

"Key remapping splits with command+arrows
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <D-down> :resize +5<cr>
nnoremap <D-up> :resize -5<cr>
nnoremap <D-right> :vertical resize +5<cr>
:nmap <C-N><C-N> :set invnumber<CR>

:map <C-F2> :echo 'Current time is ' . strftime('%c')<CR>

:%s/\s\+$//e "purge all trailing whitespace

"vdebug
let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 0,
    \    "ide_key" : '',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'compact',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}
