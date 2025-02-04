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
     (let [cmp (require :cmp)
           copilot-cmp-comparators (require :copilot_cmp.comparators)]
       (cmp.setup
         {:sources (cmp.config.sources
                     [{:name "copilot" :group_index 2}
                      {:name "nvim_lsp" :group_index 2}
                      {:name "conjure" :group_index 2}
                      {:name "buffer" :group_index 2}])
          :sorting {:priority_weight 2
                    :comparators [copilot-cmp-comparators.prioritize

                                  ;; Below is the default comparator list and order for nvim-cmp
                                  cmp.config.compare.offset
                                  ;; cmp.config.compare.scopes --this is commented in nvim-cmp too
                                  cmp.config.compare.exact
                                  cmp.config.compare.score
                                  cmp.config.compare.recently_used
                                  cmp.config.compare.locality
                                  cmp.config.compare.kind
                                  cmp.config.compare.sort_text
                                  cmp.config.compare.length
                                  cmp.config.compare.order]}
          :window {:completion (cmp.config.window.bordered)
                   :documentation (cmp.config.window.bordered)
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
