augroup neomake
    au!
    autocmd! BufRead,BufWritePost *.js Neomake standard
    autocmd! BufRead,BufWritePost * Neomake
augroup END
