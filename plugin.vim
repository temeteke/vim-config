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

call dein#load_toml(s:base_dir . 'plugin_dein.toml')
call dein#load_toml(s:base_dir . 'plugin_dein_lazy.toml', {'lazy': 1})

" denops.vim or not
if (has('patch-8.2.3452') || has('nvim-0.6.0')) && executable('deno')
	call dein#load_toml(s:base_dir . 'plugin_dein_denops.toml', {'lazy' : 1})
else
	call dein#load_toml(s:base_dir . 'plugin_dein_nodenops.toml')
endif

call dein#add('kana/vim-fakeclip')
call dein#add('lifepillar/vim-solarized8')
call dein#add('tpope/vim-surround')
call dein#add('ryym/vim-riot')
call dein#add('vim-scripts/sudo.vim')
call dein#add('stephpy/vim-yaml')

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
