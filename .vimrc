"--------------------------------------------------------------------------
" neobundle

set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleLocal ~/vim_plugin
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'nanotech/jellybeans.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    "NeoBundle 'honza/vim-snippets'
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
"¥Õ¥¡¥¤¥ë¥¿¥¤¥×¤Ë±þ¤¸¤ÆµóÆ°,¿§¤òÊÑ¤¨¤ë
syntax on
filetype plugin on
filetype indent off
"--------------------------------------------------------------------------

" for color scheme --------------------------------------
set t_Co=256
colorscheme jellybeans
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\}
" for color scheme --------------------------------------

" for using snippet --------------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" for using snippet --------------------------------------


set encoding=utf-8
set number		"¹ÔÈÖ¹æ¤ÎÉ½¼¨(ÈóÉ½¼¨¤Ïnonumber)
"set autoindent		"¼«Æ°¥¤¥ó¥Ç¥ó¥È
set tabstop=2		"Tab¥­¡¼(¥¤¥ó¥Ç¥ó¥È)¤Î¥¹¥Ú¡¼¥¹Éý
"set autoindent
set expandtab
set shiftwidth=4
set showmatch		"³ç¸Ì¤¬ÊÄ¤¸¤é¤ì¤¿¤È¤­¤ËÂÐ±þ¤¹¤ë³ç¸Ì¤ò¥Ï¥¤¥é¥¤¥È
"set incsearch		"¥¤¥ó¥¯¥ê¥á¥ó¥¿¥ë¥µ¡¼¥Á¤òON
set cursorline		"¥«¥ì¥ó¥È¹Ô¤Î¥Ï¥¤¥é¥¤¥È
"set cursorcolumn	"¥«¥ì¥ó¥ÈÎó¤Î¥Ï¥¤¥é¥¤¥È
"set laststatus=2	"¾ï¤Ë¥¹¥Æ¡¼¥¿¥¹¥é¥¤¥ó¤òÉ½¼¨
set backspace=indent,eol,start

"¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
set clipboard=unnamed,autoselect
set guioptions+=a

"wild¿¿¿¿¿¿¿
set wildmenu
set wildmode=longest,list,full

set mouse=a         "mouse¿¿¿¿¿"

"¿¿¿¿¿¿type, format, encoding, low¿¿¿"
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-t> :tabnew<CR>
"nnoremap <ESC><ESC> :nohlsearch<CR>	"ESC¤ò2²óÆþÎÏ¤Ç¸¡º÷»þ¤Î¥Ï¥¤¥é¥¤¥È¤ò²ò½ü
"
