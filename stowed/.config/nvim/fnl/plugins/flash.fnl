(import-macros {: tx} :config.macros)

(tx "folke/flash.nvim"
  {:event "VeryLazy"
   :opts {}
   :keys [(tx "s" #(doto (require :flash) (: :jump))
            {:desc "Flash"
             :mode [:n :x :o]})
          (tx "S" #(doto (require :flash) (: :treesitter))
            {:desc "Flash Treesitter"
             :mode [:n :x :o]})
          (tx "r" #(doto (require :flash) (: :remote))
            {:desc "Remote Flash"
             :mode :o})
          (tx "R" #(doto (require :flash) (: :treesitter_search))
            {:desc "Treesitter Search"
             :mode [:o :x]})
          (tx "<c-s>" #(doto (require :flash) (: :toggle))
            {:desc "Toggle Flash Search"
             :mode [:c]})]})

