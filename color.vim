if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_termtrans=1

" colorschemeを読み込む
" インストールできていない場合があるのでエラーは無視する
silent! colorscheme solarized
