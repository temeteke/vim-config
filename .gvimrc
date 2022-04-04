if filereadable(expand('~/.gvimrc.local'))
	source .gvimrc.local
endif

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

set columns=128
set lines=48

source ~/.vim/gui.vim
