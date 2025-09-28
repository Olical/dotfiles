(import-macros {: tx} :config.macros)

(vim.api.nvim_create_autocmd
  "FileType"
  {:pattern ["*"]
   :callback (fn []
               (vim.schedule
                 (fn []
                   (pcall
                     (fn []
                       (vim.treesitter.start)
                       (set vim.bo.indentexpr "v:lua.require'nvim-treesitter'.indentexpr()"))))))})

(tx
  "nvim-treesitter/nvim-treesitter"
  {:main :nvim-treesitter.configs
   :branch "main"
   :build ":TSUpdate"})
