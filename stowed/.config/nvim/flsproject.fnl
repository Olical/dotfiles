(comment
  (local config (require :nfnl.config))
  (let [{:fennel-path fennel-path
         :fennel-macro-path macro-path}
        (config.default
          {:root-dir "."
           :rtp-patterns ["."]})]
    {:extra-globals "vim"
     :lua-version "lua5.1"
     : fennel-path
     : macro-path}))

{:extra-globals "vim"
 :lua-version "lua5.1"}
