augroup neomake_hooks
    autocmd!
    autocmd BufRead,BufWritePost * Neomake
augroup END

let g:neomake_javascript_enabled_makers = ['standard', 'flow']
let g:neomake_jsx_enabled_makers = ['standard', 'flow']
