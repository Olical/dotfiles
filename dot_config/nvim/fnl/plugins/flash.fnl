(import-macros {: tx} :config.macros)

(tx "folke/flash.nvim"
  {:event "VeryLazy"
   :opts {:modes {:search {:enabled false}}}
   :keys [(tx "s" #(doto (require :flash) (: :jump))
            {:desc "Flash"
             :mode [:n :x :o]})
          (tx "gs" #(doto (require :flash) (: :treesitter))
            {:desc "Flash Treesitter"
             :mode [:n :x :o]})
          (tx "r" #(doto (require :flash) (: :remote))
            {:desc "Remote Flash"
             :mode :o})
          (tx "R" #(doto (require :flash) (: :treesitter_search))
            {:desc "Treesitter Search"
             :mode [:o :x]})]})

