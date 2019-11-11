function! <sid>clojure_autopairs()
  let b:AutoPairs = copy(g:AutoPairs)
  unlet b:AutoPairs["'"]
endfunction

autocmd FileType clojure call s:clojure_autopairs()
