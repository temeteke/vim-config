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
"-- normal --
" カーソルキーを使って表示行単位で移動
nnoremap <Down> gj
nnoremap <Up> gk

" タグスタックを戻るキーを<C-@>に
" これでソースを辿るときに<C-]><C-@>で辿れる
nnoremap <C-@> :<C-U>pop<CR>

" タブの操作をしやすく
" プレフィックスは<C-t>で
noremap <C-t>l :<C-U>tabnext<CR>
noremap <C-t>n :<C-U>tabnext<CR>
noremap <C-t>h :<C-U>tabprevious<CR>
noremap <C-t>p :<C-U>tabprevious<CR>
noremap <C-t>c :<C-U>tabnew<CR>
noremap <C-t>q :<C-U>tabclose<CR>
noremap <C-t><C-t> :<C-U>pop<CR>

" 数字をインクリメント
" Ctrl-aをtmuxのプレフィックスにしているのでCtrl-sでできるようにする。
nnoremap <C-s> <C-a>

" scroll-smooth*
nnoremap <PageUp> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
nnoremap <PageDown> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

"-- inset --
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

" Quickfixの移動
" http://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
nnoremap [q :<C-U>cprevious<CR>   " 前へ
nnoremap ]q :<C-U>cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" : と ; を入れ替える
noremap ; :
noremap : ;
