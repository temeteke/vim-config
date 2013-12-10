" 行番号表示
set number

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

" 補完を便利に
set wildmenu

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

set shell=bash

" 現在行にアンダーラインを引く (気の利いた機能付き) 
" via http://d.hatena.ne.jp/kozo-ni/20081103#1225684026
setlocal cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" マウスを使用できるようにする
" via http://cl.pocari.org/2007-03-14-3.html
set mouse=a
set ttymouse=xterm2

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

" 色の設定
set background=dark

" 英語でmake
autocmd QuickfixCmdPre make let $LANG="C"

" 自動的にQuickFixウィンドウを開く
" via http://kaworu.jpn.org/kaworu/2008-06-07-1.php
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
