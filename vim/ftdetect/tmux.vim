augroup ftdetect_tmux
  autocmd!
  autocmd BufRead,BufNewFile *.tmux.conf set filetype=tmux
augroup END