augroup neomake_hooks
    autocmd!
    autocmd BufRead,BufWritePost * Neomake
    autocmd BufRead,BufWritePost *.js Neomake standard
augroup END
