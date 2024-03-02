let s:base_dir = fnamemodify(expand('<sfile>'), ':h') . '/'

" Automatic installation on startup
if has('nvim')
    let s:jetpackfile = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
else
    let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
endif
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
    call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

" Install plugins
packadd vim-jetpack
call jetpack#begin()
call jetpack#add('tani/vim-jetpack', {'opt': 1}) "bootstrap
call jetpack#load_toml(s:base_dir . 'plugin_dein_basic.toml')
if !exists('g:vscode')
    call jetpack#load_toml(s:base_dir . 'plugin_dein_main.toml')
    call jetpack#load_toml(s:base_dir . 'plugin_dein_lazy.toml')

    if has('nvim') && !exists('g:vscode')
        call jetpack#load_toml(s:base_dir . 'plugin_dein_nvim.toml')
    else
        call jetpack#load_toml(s:base_dir . 'plugin_dein_vim.toml')
    endif

    " denops.vim or not
    let s:denops = (has('patch-8.2.3452') || has('nvim-0.6.0')) && executable('deno')
    if s:denops
        call jetpack#load_toml(s:base_dir . 'plugin_dein_denops.toml')
    else
        call jetpack#load_toml(s:base_dir . 'plugin_dein_nodenops.toml')
    endif
endif
call jetpack#end()

" Automatic plugin installation on startup
for name in jetpack#names()
    if !jetpack#tap(name)
        call jetpack#sync()
        break
    endif
endfor
