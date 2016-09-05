call plug#begin()
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-haml'
Plug 'scrooloose/nerdtree'
Plug 'kassio/neoterm'
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'rking/ag.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'carlitux/deoplete-ternjs'
Plug 'mhartington/deoplete-typescript'
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
let g:deoplete#enable_at_startup = 1
let g:jsx_ext_required = 0
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_start_length = 0
let g:auto_complete_start_length = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['rubocop']

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

colorscheme Tomorrow-Night

let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'
