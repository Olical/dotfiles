augroup neomake_hooks
    autocmd!
    autocmd BufRead,BufWritePost * Neomake
    autocmd BufRead,BufWritePost *.js Neomake standard
augroup END

let g:neomake_javascript_enabled_makers = ['standard']
