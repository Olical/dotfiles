
(import-macros {: tx} :config.macros)

(tx "FabijanZulj/blame.nvim"
  {:opts {}
   :keys [(tx "<leader>tb"
              "<CMD>BlameToggle<CR>"
              {:desc "Toggle git blame"})]})
