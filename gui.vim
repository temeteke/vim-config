set guifont=HackGen:h10,Consolas:h10
" WindowsのNeovim Qtでは複数指定ができなかったためフォントを1つ指定する
if has('nvim')
	GuiFont! HackGen:h10
endif

set background=light
