function! s:close_log()
  echom "yee"
  if expand("%:p") !~# "/tmp/conjure-log-\\d\\+.cljc"
    ConjureCloseLog
  endif
endfunction

augroup conjure
  autocmd!
  autocmd InsertEnter *.clj,*.clj[cs] :call <sid>close_log()
  autocmd FileType clojure nnoremap <buffer> <localleader>re :ConjureEvalCurrentForm<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rr :ConjureEvalRootForm<cr>
  autocmd FileType clojure vnoremap <buffer> <localleader>re :ConjureEvalSelection<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rf :ConjureEvalBuffer<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rF :ConjureLoadFile <c-r>%<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rs :ConjureStatus<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rl :ConjureOpenLog<cr>
  autocmd FileType clojure nnoremap <buffer> <localleader>rq :ConjureCloseLog<cr>
  autocmd FileType clojure nnoremap <buffer> K :ConjureDoc <c-r><c-w><cr>
augroup END
