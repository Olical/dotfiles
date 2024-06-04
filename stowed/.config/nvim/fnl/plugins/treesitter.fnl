(local uu (require :dotfiles.util))

(uu.tx
  :nvim-treesitter/nvim-treesitter
  {:opts (fn [_ opts]
           (set opts.ensure_installed
                ((. (require :astrocore) :list_insert_unique) opts.ensure_installed
                 [:clojure :fennel :kdl :markdown :diff])))})
