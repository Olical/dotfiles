augroup syntax_complete_hook
  autocmd!
  autocmd Filetype *
    \if &omnifunc == "" |
    \  setlocal omnifunc=syntaxcomplete#Complete |
    \endif
augroup END
