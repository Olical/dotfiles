autocmd FileType clojure nnoremap <buffer> <localleader>e :Eval<cr>
autocmd FileType clojure vnoremap <buffer> <localleader>e :Eval<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>f :%Eval<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>r :Require<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>R :Require!<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>t :RunTests<cr>
nnoremap <localleader>c :FireplaceConnect<cr>
