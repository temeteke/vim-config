"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/bundles')

" Let dein manage dein
" Required:
call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('tpope/vim-fugitive')
call dein#add('Shougo/neocomplcache')
call dein#add('tyru/open-browser.vim')
call dein#add('sjl/gundo.vim')
call dein#add('kana/vim-fakeclip')
call dein#add('altercation/vim-colors-solarized')
call dein#add('h1mesuke/vim-alignta')
call dein#add('kannokanno/previm')
call dein#add('tpope/vim-surround')
call dein#add('ryym/vim-riot')
call dein#add('Shougo/vimfiler')
call dein#add('vim-scripts/quickrun.vim')
call dein#add('vim-scripts/camelcasemotion')
call dein#add('vim-scripts/sudo.vim')
call dein#add('stephpy/vim-yaml')

" Markdown
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')

" Unite.vim
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-build')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neossh.vim')

" テキストオブジェクト
call dein#add('kana/vim-textobj-user')
call dein#add('sgur/vim-textobj-parameter')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------


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
" quickrun
"------------------------------------------------------------------------------"
let g:quickrun_config = {
\	'_' : {
\		'runner' : 'vimproc',
\		'runner/vimproc/updatetime' : 60,
\	},
\	'markdown' : {
\		'outputter' : 'browser',
\		'type': 'markdown/pandoc',
\		'cmdopt': '--mathml -c ~/.pandoc/github.css',
\	}
\}

"------------------------------------------------------------------------------"
" Unite
"------------------------------------------------------------------------------"
let g:unite_enable_start_insert=1

"------------------------------------------------------------------------------"
" vim-markdown
"------------------------------------------------------------------------------"
let g:vim_markdown_folding_disabled = 1
