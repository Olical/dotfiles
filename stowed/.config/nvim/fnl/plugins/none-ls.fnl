(local uu (require :dotfiles.util))

(uu.tx
  :nvimtools/none-ls.nvim
  {:opts (fn [_ config] (set config.sources {}) config)})
