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
let g:quickrun_config = {
\	'_' : {
\		'runner' : 'vimproc',
\		'runner/vimproc/updatetime' : 60,
\	},
\	'markdown' : {
\		'type' : 'markdown/pandoc',
\		'args' : '-s --mathjax',
\		'outputter' : 'browser',
\	}
\}
