let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
call jetpack#load_toml('plugin_dein_basic.toml')
call jetpack#load_toml('plugin_dein_main.toml', {'if': !exists('g:vscode')})
call jetpack#load_toml('plugin_dein_lazy.toml', {'if': !exists('g:vscode'), 'lazy': 1})

if has('nvim')
    call jetpack#load_toml('plugin_dein_nvim.toml', {'if': !exists('g:vscode')})
else
    call jetpack#load_toml('plugin_dein_vim.toml', {'if': !exists('g:vscode')})
endif

" denops.vim or not
let s:denops = (has('patch-8.2.3452') || has('nvim-0.6.0')) && executable('deno')
if s:denops
    call jetpack#load_toml('plugin_dein_denops.toml', {'if': !exists('g:vscode'), 'lazy': 1})
else
    call jetpack#load_toml('plugin_dein_nodenops.toml', {'if': !exists('g:vscode')})
endif

call jetpack#end()
