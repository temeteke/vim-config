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
