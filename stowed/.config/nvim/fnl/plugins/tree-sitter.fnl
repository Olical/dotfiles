(import-macros {: tx} :config.macros)

(tx "nvim-treesitter/nvim-treesitter"
  {:main :nvim-treesitter.configs
   :branch "main"})
