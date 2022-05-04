if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

source ~/.vim/map.vim
source ~/.vim/plugin.vim
source ~/.vim/color.vim
source ~/.vim/misc.vim
