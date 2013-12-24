if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

source ~/.vim/misc.vim
source ~/.vim/map.vim
source ~/.vim/plugin.vim
