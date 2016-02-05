"--------------------------------------------------------------------------
" neobundle

set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleLocal ~/vim_plugin
call neobundle#end()


" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif
NeoBundleCheck

filetype plugin indent on     " Required!
"--------------------------------------------------------------------------
syntax on
filetype plugin on
filetype indent off
"--------------------------------------------------------------------------

set t_Co=256
"set background=dark
colorscheme jellybeans

let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\}

set number
"set autoindent
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
"set incsearch
set cursorline
"set cursorcolumn
"set laststatus=2
set backspace=indent,eol,start

"nnoremap <ESC><ESC> :nohlsearch<CR>
