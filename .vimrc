if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

source ~/.vim/misc.vim
source ~/.vim/plugin.vim
source ~/.vim/map.vim
