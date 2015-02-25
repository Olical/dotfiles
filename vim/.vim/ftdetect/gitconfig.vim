augroup ftdetect_gitconfig
  autocmd!
  autocmd BufRead,BufNewFile *.gitconfig set filetype=gitconfig
augroup END