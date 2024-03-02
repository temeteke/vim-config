" Windowsでも.vimディレクトリを使う
set runtimepath+=$HOME/.vim,$HOME/.vim/after
set packpath+=$HOME/.vim

if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

source ~/.vim/map.vim
source ~/.vim/plugin.vim
source ~/.vim/color.vim
source ~/.vim/misc.vim
