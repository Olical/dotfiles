autocmd Filetype *
  \if &omnifunc == "" |
  \  setlocal omnifunc=syntaxcomplete#Complete |
  \endif
