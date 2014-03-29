set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

"　プラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'

filetype plugin indent on

" 未インストールのbundleがないかチェック
NeoBundleCheck
