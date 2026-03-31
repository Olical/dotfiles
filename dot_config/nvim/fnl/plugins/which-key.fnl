(import-macros {: tx} :config.macros)

(tx "folke/which-key.nvim"
  {:event "VeryLazy"
   :config (fn []
             (let [wk (require :which-key)]
               (wk.add
                 [(tx "<leader>a" {:group "AI"})
                  (tx "<leader>b" {:group "Buffer"})
                  (tx "<leader>f" {:group "Find"})
                  (tx "<leader>l" {:group "LSP"})
                  (tx "<leader>la" {:group "LSP actions"})
                  (tx "<leader>g" {:group "Git"})
                  (tx "<leader>s" {:group "Search"})
                  (tx "<leader>n" {:group "Notifications"})
                  (tx "<leader>t" {:group "Toggle"})
                  (tx "<leader>td" {:group "Toggle diagnostics"})
                  (tx "<leader>d" {:group "Diffview"})])))})
