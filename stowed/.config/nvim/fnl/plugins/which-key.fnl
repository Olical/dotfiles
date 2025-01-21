(import-macros {: tx} :config.macros)

(tx "folke/which-key.nvim"
  {:opts {}
   :keys [(tx "<leader>?"
            #(doto (require "which-key")
               (: :show {:global false}))
            {:desc "Buffer Local Keymaps (which-key)"})]})
