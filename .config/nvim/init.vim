"==<etc>======================================================================
" vi互換機能オフ
set nocompatible
" バックアップを作らない
set nobackup
" swpファイルを作らない
set noswapfile
" vim開始時の挨拶を表示しない
set shortmess+=I
" 行番号表示
set number
" メッセージ表示に使う行数
set cmdheight=1
" バッファ放棄時にhidden状態になる
set hidden
" コマンド保存数
set history=1000
" backspaceキーを使えるようにする
set backspace=indent,eol,start
" mouse mode
set mouse=a
" 行をまたいで移動出来るようにする
set whichwrap=b,s,h,l,<,>,[,]
" 全角記号対策
set ambiwidth=double
"ヤンクでクリップボードにコピー。外部ツールのインストールが必要。詳しくはdocument参照
set clipboard+=unnamedplus

" grep設定
" agがあれば使う
if executable('ag')
  set grepprg=ag\ --nogroup
  set grepformat=%f:%l:%m
endif

" <Leader>及び<LocalLeader>をデフォルトの\からspaceにする
let mapleader = ' '
let maplocalleader = ' '

"==<tabkey>===================================================================
set cindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2

autocmd BufEnter * call SetTab()
function! SetTab()
  execute 'set softtabstop=2 | set shiftwidth=2 | set tabstop=2'
endfunction

"==<search>===================================================================
" .が何か一文字という意味になる
set magic
" 大文字が含まれている時のみ、大文字と小文字が区別される
set ignorecase smartcase
" 検索結果の強調表示する
set hlsearch
" インクリメンタルサーチする
set incsearch

"==<status line>==============================================================
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに文字コードと改行コードを表示させる
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" コマンドライン補完を拡張モードにする
set wildmenu
set wildmode=list:longest,full
" 現在のカーソル位置(行、桁)を右下に常に表示
set ruler
" 入力途中のコマンドを表示
set showcmd

"==<encode>===================================================================
set encoding=utf-8
set fileencoding=utf-8

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rking/ag.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'Shougo/denite.nvim'
Plug 'kchmck/vim-coffee-script'
Plug 'kassio/neoterm'
Plug 'chriskempson/base16-vim'
Plug '907th/vim-auto-save'
call plug#end()

"syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby', 'haml'] }
let g:syntastic_ruby_checkers = ['rubocop', 'haml_lint']

set sh=zsh

"neoterm
let g:neoterm_position = 'horizontal'
" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

" deoplete
let g:deoplete#enable_at_startup = 1
"Tabで補完を選択
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 

"==<color>===================================================================
"base16-default-dark
let base16colorspace=256
colorscheme base16-default-dark

"スペースの可視化
highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /\s\+$\|　/
"Tabの可視化
set list
set listchars=tab:»-

"auto-save
let g:auto_save = 1
