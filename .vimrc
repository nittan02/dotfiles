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
    NeoBundle 'Shougo/vimshell.vim'
    NeoBundle 'Shougo/vimproc.vim'
    NeoBundle 'Shougo/unite.vim'
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

"--------------------------------------------------------------------------
filetype plugin indent on     " Required!
syntax on
filetype plugin on
filetype indent on
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


"-----------------------------------------------------------------------------
"" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"-----------------------------------------------------------------------------

" ruby真真真真真
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

set termencoding=euc-jp 
set encoding=utf-8
set number		"行番号の表示(非表示はnonumber)
"set autoindent		"自動インデント
set tabstop=2		"Tabキー(インデント)のスペース幅
set autoindent
set expandtab
set shiftwidth=4
set showmatch		"括弧が閉じられたときに対応する括弧をハイライト
"set incsearch		"インクリメンタルサーチをON
set cursorline		"カレント行のハイライト
"set cursorcolumn	"カレント列のハイライト
"set laststatus=2	"常にステータスラインを表示
set backspace=indent,eol,start

"真真真真真真真真
set clipboard=unnamed,autoselect
set guioptions+=a

"wild真真真�
set wildmenu
set wildmode=longest,list,full

"set mouse=a         "mouse真真�"

"真真真type, format, encoding, low真�"
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

noremap  <C-j> <esc>
noremap! <C-j> <esc>

nnoremap <silent><C-o> :sp<CR><C-w><C-w><C-w>10-:VimShell<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-t> :tabnew<CR>
"nnoremap <ESC><ESC> :nohlsearch<CR>	"ESCを2回入力で検索時のハイライトを解除
"
