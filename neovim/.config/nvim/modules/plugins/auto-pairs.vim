function! <sid>lisp_autopairs()
  let b:AutoPairs = copy(g:AutoPairs)
  unlet b:AutoPairs["'"]
endfunction

autocmd FileType clojure,fennel,scheme call s:lisp_autopairs()
