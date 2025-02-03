(import-macros {: tx} :config.macros)

(tx "johnfrankmorgan/whitespace.nvim"
  {:event "VeryLazy"
   :main "whitespace-nvim"
   :opts {}
   :keys [(tx "<leader>bt" (fn [] ((. (require :whitespace-nvim) :trim)))
            {:desc "Trim whitespace"})]})
