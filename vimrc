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

" 自動的にQuickFixウィンドウを開く
" via http://kaworu.jpn.org/kaworu/2008-06-07-1.php
au QuickfixCmdPost make,grep,grepadd,vimgrep copen


"-------------------------------------------------------------------------------
" Mapping <jump-tag>
" via http://a-newcomer.com/11
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  - 
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
" Ctrl-j,Ctrl-kでカーソルを表示行で移動する。物理行移動はj,k
nnoremap <C-j> gj
nnoremap <C-k> gk
nnoremap <Down> gj
nnoremap <Up> gk

" Shift-j,Shift-kで半画面スクロール
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

" Shift-h,Shift-lで大きく移動
nnoremap <S-h> 5h
nnoremap <S-l> 5l

" 挿入モードでのカーソル移動
" via http://qiita.com/items/14389dbaaa43d25f3254
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

" Ctrlを使って削除
inoremap <C-h> 
inoremap <C-l> [3~
inoremap <C-u> <ESC>ld^i
inoremap <C-o> <ESC>ld$a

" j/kを押しまくった時insertモードから抜ける
" via http://qiita.com/items/14389dbaaa43d25f3254
inoremap <silent> hhh <ESC>
inoremap <silent> jjj <ESC>
inoremap <silent> kkk <ESC>
inoremap <silent> lll <ESC>

"copenで飛べなかったので無効
"" 挿入モードにならずに改行を入れる
"nnoremap <CR> o<ESC>

" タグスタックを戻るキーを<C-_>に
" これでソースを辿るときに<C-]><C-_>で辿れる
nnoremap <C-_> :pop<CR>
" Shift押しながら戻るようにしたほうがやりやすいかもと思って実験
nnoremap <C-S-]> :pop<CR>
" これも実験
nnoremap <C-@> :pop<CR>

" タブの操作をしやすく
" プレフィックスは<C-t>で
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t>n :tabnext<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>p :tabprevious<CR>
nnoremap <C-t>c :tabnew<CR>
nnoremap <C-t>q :tabclose<CR>
nnoremap <C-t><C-t> :pop<CR>

" 数字をインクリメント
" Ctrl-aをtmuxのプレフィックスにしているのでCtrl-sでできるようにする。
nnoremap <C-s> <C-a>

"------------------------------------------------------------------------------"
" migemo
"------------------------------------------------------------------------------"
" via http://d.hatena.ne.jp/eholic/20091111/p1
noremap // :<C-u>Migemo<CR>

"------------------------------------------------------------------------------"
" neocomplcache
"------------------------------------------------------------------------------"
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

"------------------------------------------------------------------------------"
" netrm.vim
"------------------------------------------------------------------------------"
" via http://blog.tojiru.net/article/234400966.html
" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
"let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

"------------------------------------------------------------------------------"
" NERDTree
"------------------------------------------------------------------------------"
" 引数なしでvimを開いたらNERDTreeを起動、引数ありならNERDTreeは起動しないように
" via http://kokukuma.blogspot.jp/2011/12/vim-essential-plugin-nerdtree.html
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
endif

"------------------------------------------------------------------------------"
" SrcExpl
"------------------------------------------------------------------------------"
" via http://d.hatena.ne.jp/guyon/20080409/1207737955
"" 自動で表示
"let g:SrcExpl_RefreshTime = 1 
"" tagsをsrcexpl起動時に自動で作成
"let g:SrcExpl_UpdateTags = 1

"------------------------------------------------------------------------------"
" quickrun
"------------------------------------------------------------------------------"
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser',
      \ }

"------------------------------------------------------------------------------"
" neobundle
"------------------------------------------------------------------------------"
if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'motemen/git-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'mattn/multi-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tyru/open-browser.vim'
" vim-scripts repos
NeoBundle 'quickrun.vim'
NeoBundle 'Markdown'
NeoBundle "taglist.vim"
NeoBundle "camelcasemotion"


filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck
