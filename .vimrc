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
"ファイルタイプに応じて挙動,色を変える
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

set number		"行番号の表示(非表示はnonumber)
"set autoindent		"自動インデント
set tabstop=4		"Tabキー(インデント)のスペース幅
set autoindent
set expandtab
set shiftwidth=4
set showmatch		"括弧が閉じられたときに対応する括弧をハイライト
"set incsearch		"インクリメンタルサーチをON
set cursorline		"カレント行のハイライト
"set cursorcolumn	"カレント列のハイライト
"set laststatus=2	"常にステータスラインを表示
set backspace=indent,eol,start



"nnoremap <ESC><ESC> :nohlsearch<CR>	"ESCを2回入力で検索時のハイライトを解除
