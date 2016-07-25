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
Plug 'cakebaker/scss-syntax.vim'
Plug 'scrooloose/syntastic'
call plug#end()

" 行数
set number

set noswapfile

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['rubocop']

colorscheme jellybeans
