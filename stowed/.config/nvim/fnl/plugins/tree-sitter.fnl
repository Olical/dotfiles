(import-macros {: pack} :config.macros)

(pack "nvim-treesitter/nvim-treesitter"
  {:main :nvim-treesitter.configs
   :opts {:auto_install true}})
