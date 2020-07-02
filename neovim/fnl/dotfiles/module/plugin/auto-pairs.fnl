(module dotfiles.module.plugin.auto-pairs
  {require {core aniseed.core
            nvim aniseed.nvim}})

(defn init []
  (let [auto-pairs nvim.g.AutoPairs]
    (tset auto-pairs "'" nil)
    (tset auto-pairs "`" nil)
    (set nvim.b.AutoPairs auto-pairs)))

(vim.schedule
  (fn []
    (nvim.ex.autocmd
      :FileType
      "clojure,fennel,scheme"
      "lua require('dotfiles.module.plugin.auto-pairs').init()")))
