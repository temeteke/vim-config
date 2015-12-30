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

" scroll-smooth*
nnoremap <PageUp> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
nnoremap <PageDown> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

"------------------------------------------------------------------------------"
" migemo
"------------------------------------------------------------------------------"
" via http://d.hatena.ne.jp/eholic/20091111/p1
noremap // :<C-u>Migemo<CR>

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
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" Unite
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]

nnoremap <silent> [unite]f :<C-u>Unite<Space>file<Space>file/new<CR>
nnoremap <silent> [unite]u :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]p :<C-u>Unite<Space>file_rec/async:!<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> [unite]l :<C-u>Unite<Space>line<CR>

" : と ; を入れ替える
noremap ; :
noremap : ;

" fugitive
nnoremap [fugitive]    <Nop>
nmap     <Space>g [fugitive]
nnoremap <silent> [fugitive]s :Gstatus<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
