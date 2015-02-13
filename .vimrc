if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

source ~/.vim/plugin.vim
source ~/.vim/misc.vim
source ~/.vim/map.vim
