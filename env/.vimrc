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

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
