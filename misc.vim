" 行番号表示
set number

" アンドゥの永続化
set undofile
set undodir=./.vimundo,~/.vimundo

" 色をつける
syntax on

" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
" 
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

" 現在行にアンダーラインを引く (気の利いた機能付き) 
" via http://d.hatena.ne.jp/kozo-ni/20081103#1225684026
setlocal cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" マウスを使用できるようにする
" via http://cl.pocari.org/2007-03-14-3.html
set mouse=a
if !has('nvim')
	set ttymouse=xterm2
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
set spell

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
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
