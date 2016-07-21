call plug#begin()
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'tpope/vim-haml'
Plug 'scrooloose/nerdtree'
Plug 'kassio/neoterm'
Plug 'nanotech/jellybeans.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/denite.nvim'
Plug 'rking/ag.vim'
call plug#end()

" 行数
set number

set noswapfile

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

colorscheme jellybeans
