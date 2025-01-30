(import-macros {: tx} :config.macros)

(tx "olimorris/codecompanion.nvim"
  {:event "VeryLazy"
   :main "codecompanion"
   :dependencies ["nvim-lua/plenary.nvim" "nvim-treesitter/nvim-treesitter"]
   :keys [(tx "<leader>fa" "<CMD>Telescope codecompanion<CR>" {:desc "Find AI actions"})
          (tx "<leader>a:" ":CodeCompanionCmd " {:desc "AI a Neovim command"})
          (tx "<leader>ao" "<CMD>CodeCompanionChat<CR>" {:desc "Open AI chat"})
          (tx "<leader>ai" ":CodeCompanion " {:desc "AI buffer or selection" :mode ["n" "v"]})]
   :opts {}})
