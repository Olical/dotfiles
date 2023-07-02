(local uu (require :user.util))

[(uu.tx
   :guns/vim-sexp
   {:init (fn []
            (set vim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))})

 (uu.tx :tpope/vim-sexp-mappings-for-regular-people)]
