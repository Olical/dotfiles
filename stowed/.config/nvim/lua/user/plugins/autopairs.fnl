(local uu (require :user.util))
(local fun (require :user.vendor.fun))

(local lisps [:scheme :lisp :clojure :fennel])

(uu.tx
  :windwp/nvim-autopairs
  {:init (fn []
           (local autopairs (require :nvim-autopairs))
           (tset (fun.head (autopairs.get_rules "'")) :not_filetypes lisps)
           (tset (fun.head (autopairs.get_rules "`")) :not_filetypes lisps))})
