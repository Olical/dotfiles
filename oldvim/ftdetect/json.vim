augroup JsonDetect
  autocmd!
  autocmd BufNewFile,BufRead *.webapp set filetype=json
  autocmd BufNewFile,BufRead .jshintrc set filetype=json
  autocmd BufNewFile,BufRead .bowerrc set filetype=json
  autocmd BufNewFile,BufRead .tern-project set filetype=json
augroup END
