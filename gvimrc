if filereadable(expand('~/.gvimrc.local'))
	source .gvimrc.local
endif

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

colorscheme desert

set guifont=Consolas:h9

set columns=128
set lines=48
