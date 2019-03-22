nnoremap <localleader>re :ConjureEvalCurrentForm<cr>
nnoremap <localleader>rr :ConjureEvalRootForm<cr>
vnoremap <localleader>re :ConjureEvalSelection<cr>
nnoremap <localleader>rf :ConjureEvalBuffer<cr>
nnoremap <localleader>rd :ConjureLoadFile <c-r>%<cr>
nnoremap <localleader>rs :ConjureStatus<cr>
nnoremap <localleader>rl :ConjureOpenLog<cr>
nnoremap <localleader>rq :ConjureCloseLog<cr>
nnoremap K :ConjureDoc <c-r><c-w><cr>

function! s:close_log()
  if expand("%:p") !~# "/tmp/conjure-log-\\d\\+.cljc"
    ConjureCloseLog
  endif
endfunction

augroup conjure
  autocmd!
  autocmd! InsertEnter *.clj\(c\|s\) :call <sid>close_log()
augroup END
