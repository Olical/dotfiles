" Evaluate the form under the cursor.
nnoremap <localleader>rr :ConjureEvalCurrentForm<cr>

" Evaluate the outermost form.
nnoremap <localleader>re :ConjureEvalRootForm<cr>

" Evaluate whatever is currently visually selected.
vnoremap <localleader>re :ConjureEvalSelection<cr>

" Evaluate the entire buffer.
" Taken from the buffer, not the file on disk.
nnoremap <localleader>rf :ConjureEvalBuffer<cr>

" Evaluate the file from the disk.
nnoremap <localleader>rd :ConjureLoadFile <c-r>%<cr>

" Log the current connections and their configuration.
nnoremap <localleader>rs :ConjureStatus<cr>

" Expand and focus the log.
nnoremap <localleader>rl :ConjureOpenLog<cr>

" Close the log if it's open.
nnoremap <localleader>rq :ConjureCloseLog<cr>

" Look up documentation for the word under the cursor.
nnoremap K :ConjureDoc <c-r><c-w><cr>

" Closes the log if we're not currently inside it.
function! s:close_log()
  if expand("%:p") !~# "/tmp/conjure-log-\\d\\+.cljc"
    ConjureCloseLog
  endif
endfunction

augroup conjure
  " Close the log when entering insert mode.
  autocmd! InsertEnter *.clj\(c\|s\) :call <sid>close_log()
augroup END
