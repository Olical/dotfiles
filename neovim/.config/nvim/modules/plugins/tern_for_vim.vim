augroup tern_for_vim_omnifunc
  autocmd!
  autocmd FileType javascript,jsx,javascript.jsx setl omnifunc=tern#Complete
augroup END

let g:tern_show_signature_in_pum = 1
