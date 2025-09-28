(import-macros {: tx} :config.macros)

(vim.api.nvim_create_autocmd
  "FileType"
  {:pattern ["*"]
   :callback #(vim.schedule #(pcall #(vim.treesitter.start)))})

(tx
  "nvim-treesitter/nvim-treesitter"
  {:main :nvim-treesitter.configs
   :branch "main"
   :build ":TSUpdate"})
