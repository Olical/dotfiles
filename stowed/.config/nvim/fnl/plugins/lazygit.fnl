(import-macros {: tx} :config.macros)

(tx "kdheepak/lazygit.nvim"
  {:dependencies ["nvim-lua/plenary.nvim"]
   :lazy true
   :cmd ["LazyGit" "LazyGitConfig" "LazyGitCurrentFile" "LazyGitFilter" "LazyGitFilterCurrentFile"]
   :keys [(tx "<leader>gg" "<CMD>LazyGit<CR>" {:desc "LazyGit"})]})
