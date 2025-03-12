(import-macros {: tx} :config.macros)

[(tx "FabijanZulj/blame.nvim"
  {:opts {}
   :keys [(tx "<leader>tb"
              "<CMD>BlameToggle<CR>"
              {:desc "Toggle git blame"})]})
 (tx "sindrets/diffview.nvim"
  {:opts {}
   :cmd ["DiffviewOpen"
         "DiffviewClose"
         "DiffviewToggleFiles"
         "DiffviewFocusFiles"
         "DiffviewRefresh"
         "DiffviewFileHistory"
         "DiffviewLog"]
   :keys [(tx "<leader>do" "<CMD>DiffviewOpen<CR>" {:desc "Open Diffview"})
          (tx "<leader>dq" "<CMD>DiffviewClose<CR>" {:desc "Close Diffview"})
          (tx "<leader>dr" "<CMD>DiffviewRefresh<CR>" {:desc "Refresh Diffview"})
          (tx "<leader>dt" "<CMD>DiffviewToggleFiles<CR>" {:desc "Toggle Diffview files"})
          (tx "<leader>df" "<CMD>DiffviewFocusFiles<CR>" {:desc "Focus Diffview files"})
          (tx "<leader>dh" "<CMD>DiffviewFileHistory<CR>" {:desc "Diffview file history"})
          (tx "<leader>dl" "<CMD>DiffviewLog<CR>" {:desc "Diffview log"})]})
 (tx "lewis6991/gitsigns.nvim"
   {:event "VeryLazy"
    :opts {}})
 (tx "kdheepak/lazygit.nvim"
   {:dependencies ["nvim-lua/plenary.nvim"]
    :cmd ["LazyGit" "LazyGitConfig" "LazyGitCurrentFile" "LazyGitFilter" "LazyGitFilterCurrentFile"]
    :keys [(tx "<leader>gg" "<CMD>LazyGit<CR>" {:desc "LazyGit"})]})]
