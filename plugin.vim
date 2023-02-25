if has('nvim')
	let s:plugin_dir='~/.cache/dein'
else
	let s:plugin_dir='~/.vim/bundles'
endif

let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/'


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
execute 'set runtimepath+=' . s:plugin_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
call dein#begin(s:plugin_dir)

" Let dein manage dein
" Required:
call dein#add(s:plugin_dir . '/repos/github.com/Shougo/dein.vim')

call dein#load_toml(s:base_dir . 'dein.toml')
call dein#load_toml(s:base_dir . 'dein_lazy.toml', {'lazy': 1})

call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" denops.vim or not
if (has('patch-8.2.3452') || has('nvim-0.6.0')) && executable('deno')
	call dein#load_toml(s:base_dir . 'denops.toml', {'lazy' : 1})
else
	call dein#load_toml(s:base_dir . 'nodenops.toml')
endif

call dein#add('kana/vim-fakeclip')
call dein#add('lifepillar/vim-solarized8')
call dein#add('h1mesuke/vim-alignta')
call dein#add('tpope/vim-surround')
call dein#add('ryym/vim-riot')
call dein#add('vim-scripts/camelcasemotion')
call dein#add('vim-scripts/sudo.vim')
call dein#add('stephpy/vim-yaml')

" Markdown
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')

" テキストオブジェクト
call dein#add('kana/vim-textobj-user')
call dein#add('sgur/vim-textobj-parameter')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


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
" vim-markdown
"------------------------------------------------------------------------------"
let g:vim_markdown_folding_disabled = 1
