" 行番号表示
set number

" アンドゥの永続化
if has('persistent_undo')
	if !has('nvim')
		set undodir=~/.vim/undo
	endif
	set undofile
endif

" 色をつける
syntax on

" 画面上でタブ文字が占める幅の設定
set tabstop=4
" 自動インデントやコマンド "<<", ">>" でずれる幅
set shiftwidth=4
" <Tab> や <BS> を打ち込んだときにカーソルが動く幅
set softtabstop=0

" 補完
set wildmode=longest,list

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示
set hlsearch

" インデント
set autoindent
set smartindent

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" インクリメンタルサーチ
set incsearch

" ルーラーを表示
set ruler

" バックアップファイルを作成しない
set nobackup

" for Windows
set shellslash

" カーソル位置を強調
set cursorline

" マウスを使用できるようにする
" https://yskwkzhr.blogspot.com/2013/02/use-mouse-on-terminal-vim.html
if has('mouse')
	set mouse=a
	if !has('nvim')
		if has('mouse_sgr')
			set ttymouse=sgr
		else
			set ttymouse=xterm2
		endif
	endif
endif

" クリップボードにコピーするようにする
set clipboard=unnamed

" バックスペースで改行とかも削除できるようにする
set backspace=2

" バックスペースが効くようにする
" via http://blawat2015.no-ip.com/~mieki256/diary/200312123.html
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 

" 日本語の文字コードを自動判別
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" 英語でmake
autocmd QuickfixCmdPre make let $LANG="C"

" 自動的にQuickFixウィンドウを開く
" via http://kaworu.jpn.org/kaworu/2008-06-07-1.php
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" マーカーで折りたたみ
set foldmethod=marker

" c*でカーソル下のキーワードを置換
" via http://miniman2011.blog55.fc2.com/blog-entry-295.html
nnoremap <expr> c* ':%s ;\<' . expand('<cword>') . '\>;'
vnoremap <expr> c* ':s ;\<' . expand('<cword>') . '\>;'

" スペルチェック
if v:version > 704 || (v:version == 704 && has('patch088'))
	set spelllang+=cjk
endif
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" diff
set diffopt+=vertical

" バイナリ
" http://d.hatena.ne.jp/rdera/20081022/1224682665
"バイナリ編集(xxd)モード（vim -b での起動、もしくは *.bin ファイルを開くと発動します）
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre  *.bin let &binary =1
	autocmd BufReadPost * if &binary | silent %!xxd -g 1
	autocmd BufReadPost * set ft=xxd | endif
	autocmd BufWritePre * if &binary | %!xxd -r | endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END

" :DiffOrig
" vimrc_example.vim
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

" IME デフォルトオフ
set iminsert=0
set imsearch=-1

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" カーソル
" https://qiita.com/Linda_pp/items/10e0c94eb82b18071db34
" https://oki2a24.com/2019/02/19/how-to-set-terminal-vim-cursor-in-vimrc-as-i-leraned-from-mintty-wiki-tips/
" https://ttssh2.osdn.jp/manual/4/ja/usage/tips/vim.html
if has('vim_starting')
	" 起動時に非点滅のブロックタイプのカーソルに設定
	let &t_ti .= "\e[2 q"
	" ノーマルモード時に非点滅のブロックタイプのカーソルに設定
	let &t_EI .= "\e[2 q"
	" 挿入モード時に非点滅の縦棒タイプのカーソルに設定
	let &t_SI .= "\e[6 q"
	" 置換モード時に非点滅の下線タイプのカーソルに設定
	let &t_SR .= "\e[4 q"
	" 終了時にデフォルトのカーソルに設定
	let &t_te .= "\e[0 q"
endif

" netrw
" ツリー形式
let g:netrw_liststyle = 3
" 水平分割では下に開く
let g:netrw_alto = 1
" 垂直分割では右に開く
let g:netrw_altv = 1
