(local uu (require :dotfiles.util))

(uu.tx
  :NMAC427/guess-indent.nvim
  {:opts {:filetype_exclude [:clojure :fennel]}})
