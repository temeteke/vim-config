"------------------------------------------------------------------------------"
" neobundle
"------------------------------------------------------------------------------"
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kannokanno/previm'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ryym/vim-riot'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'quickrun.vim'
NeoBundle "taglist.vim"
NeoBundle "camelcasemotion"
NeoBundle 'sudo.vim'
NeoBundle 'stephpy/vim-yaml'

" Markdown
NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'

" Unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-build'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neossh.vim'

" テキストオブジェクト
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
" auto-ctags.vim
"------------------------------------------------------------------------------"
let g:auto_ctags = 1
let g:auto_ctags_tags_args = '--tag-relative --recurse --langmap=C++:+.cu'
let g:auto_ctags_directory_list = ['.git']

"------------------------------------------------------------------------------"
" Unite
"------------------------------------------------------------------------------"
let g:unite_enable_start_insert=1

"------------------------------------------------------------------------------"
" vim-markdown
"------------------------------------------------------------------------------"
let g:vim_markdown_folding_disabled = 1
