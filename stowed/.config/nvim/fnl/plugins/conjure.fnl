(import-macros {: tx} :config.macros)

(set vim.g.conjure#filetype#fennel "conjure.client.fennel.nfnl")
(set vim.g.conjure#mapping#doc_word "K")

(tx "Olical/conjure"
  {:event "VeryLazy"
   :dev true})
