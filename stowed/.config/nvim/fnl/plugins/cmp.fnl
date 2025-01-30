(import-macros {: tx} :config.macros)

(tx "hrsh7th/nvim-cmp"
  {:event "VeryLazy"
   :main "cmp"
   :dependencies ["hrsh7th/cmp-nvim-lsp"
                  "hrsh7th/cmp-buffer" 
                  "hrsh7th/cmp-path"
                  "hrsh7th/cmp-cmdline"
                  "PaterJason/cmp-conjure"
                  "Olical/conjure"
                  "zbirenbaum/copilot-cmp"
                  "olimorris/codecompanion.nvim"]

   :config
   (fn []
     (let [cmp (require :cmp)]
       (cmp.setup
         {:sources (cmp.config.sources
                     [{:name "nvim_lsp"}
                      {:name "buffer"}
                      {:name "conjure"}
                      {:name "copilot"}])
          :window {;; :completion (cmp.config.window.bordered)
                   ;; :documentation (cmp.config.window.bordered)
                   }
          :mapping (cmp.mapping.preset.insert
                     {"<C-b>" (cmp.mapping.scroll_docs -4)
                      "<C-f>" (cmp.mapping.scroll_docs 4)
                      "<C-Space>" (cmp.mapping.complete)
                      "<C-e>" (cmp.mapping.abort)
                      "<CR>" (cmp.mapping.confirm {:select false})})})

       ; (cmp.setup.cmdline
       ;   ["/" "?"]
       ;   {:mapping (cmp.mapping.preset.cmdline)
       ;    :sources [{:name "buffer"}]})

       (cmp.setup.cmdline
         ":"
         {:mapping (cmp.mapping.preset.cmdline)
          :sources (cmp.config.sources [{:name "path"} {:name "cmdline"}])
          :matching {:disallow_symbol_nonprefix_matching false}})))})
