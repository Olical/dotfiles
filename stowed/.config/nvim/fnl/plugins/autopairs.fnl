(import-macros {: tx} :config.macros)

(tx "windwp/nvim-autopairs"
  {:event "InsertEnter"
   :opts {:enable_check_bracket_line false}})
