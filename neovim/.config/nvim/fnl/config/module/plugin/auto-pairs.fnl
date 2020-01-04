(local core (require :aniseed.core))
(local nvim (require :aniseed.nvim))
(local nu (require :aniseed.nvim.util))

(fn init []
  (let [auto-pairs nvim.g.AutoPairs]
    (tset auto-pairs "'" nil)
    (set nvim.b.AutoPairs auto-pairs)))

(vim.schedule
  (fn []
    (nvim.ex.autocmd
      :FileType
      "clojure,fennel,scheme"
      "lua require('config.module.plugin.auto-pairs').init()")))

{:init init}
