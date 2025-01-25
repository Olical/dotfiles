(import-macros {: tx} :config.macros)

(tx "hrsh7th/nvim-cmp"
  {:event "VeryLazy"
   :main "cmp"
   :dependencies ["hrsh7th/cmp-nvim-lsp"
                  "hrsh7th/cmp-buffer" 
                  "hrsh7th/cmp-path"
                  "hrsh7th/cmp-cmdline"]
   :opts {}})


