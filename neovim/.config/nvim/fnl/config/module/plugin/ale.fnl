(local nvim (require :aniseed.nvim))

(set nvim.g.ale_linters
  {:javascript [:standard]
   :clojure [:clj-kondo :joker]})
