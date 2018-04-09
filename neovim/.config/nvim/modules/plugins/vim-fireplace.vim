autocmd FileType clojure nnoremap <buffer> <localleader>fe :Eval<cr>
autocmd FileType clojure vnoremap <buffer> <localleader>fe :Eval<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>fE :%Eval<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>fr :Require<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>fR :Require!<cr>
autocmd FileType clojure nnoremap <buffer> <localleader>ft :RunTests<cr>
nnoremap <localleader>fc :FireplaceConnect<cr>
