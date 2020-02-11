(module config.module.plugin.ale
  {require {nvim aniseed.nvim}})

(set nvim.g.ale_linters
  {:javascript [:standard]
   :clojure [:clj-kondo :joker]})
