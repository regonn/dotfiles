set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

" プラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'Shougo/neocomplcache.vim'

" 未インストールのbundleがないかチェック
NeoBundleCheck

colorscheme railscasts

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

" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1

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

"インデントハイライト
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=235
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=237
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 2

"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"Back space対応
set backspace=start,eol,indent
