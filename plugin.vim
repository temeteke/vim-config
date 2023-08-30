if has('nvim')
    let s:plugin_dir='~/.cache/dein'
else
    let s:plugin_dir='~/.vim/bundles'
endif

let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/'


" Dein.vim
if &compatible
    set nocompatible
endif

execute 'set runtimepath+=' . s:plugin_dir . '/repos/github.com/Shougo/dein.vim'

call dein#begin(s:plugin_dir)

" Let dein manage dein
call dein#add(s:plugin_dir . '/repos/github.com/Shougo/dein.vim')

call dein#load_toml(s:base_dir . 'plugin_dein_basic.toml')
if !exists('g:vscode')
    call dein#load_toml(s:base_dir . 'plugin_dein_main.toml')
    call dein#load_toml(s:base_dir . 'plugin_dein_lazy.toml', {'lazy': 1})

    " denops.vim or not
    let s:denops = (has('patch-8.2.3452') || has('nvim-0.6.0')) && executable('deno')
    if s:denops
        call dein#load_toml(s:base_dir . 'plugin_dein_denops.toml', {'lazy' : 1})
    else
        call dein#load_toml(s:base_dir . 'plugin_dein_nodenops.toml')
    endif
endif

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif
