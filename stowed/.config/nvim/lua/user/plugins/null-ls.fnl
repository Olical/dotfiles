(local uu (require :user.util))

(uu.tx
 :jose-elias-alvarez/null-ls.nvim
 {:opts (fn [_ config] (set config.sources {}) config)})
