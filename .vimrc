call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rking/ag.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-ruby/vim-ruby'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-rails'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/denite.nvim'
call plug#end()

"syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

filetype plugin indent off

syntax on
filetype plugin on

filetype indent on

"mouse
set mouse=a
set ttymouse=xterm2

"Tab、行末の半角スペースを明示的に表示する
set list
set listchars=tab:^\ ,trail:~

" ハイライトを有効にする
syntax on
set nohlsearch

"行番号表示
set number

"タブを設定
set expandtab
set shiftwidth=2
set softtabstop=2

"自動的にインデントする
set autoindent

"タイトル表示
set title

"アクティブな行をハイライト
set cursorline

"カッコの対応をハイライト
set showmatch

"コマンドライン2行
set cmdheight=2
set laststatus=2
set statusline=%F%r%h%=

"コマンド表示
set showcmd

"スワップファイルを作らない
set noswapfile

"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"Back space対応
set backspace=start,eol,indent

"grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow


