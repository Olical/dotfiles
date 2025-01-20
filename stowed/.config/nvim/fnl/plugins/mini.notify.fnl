(import-macros {: pack} :config.macros)

(pack "echasnovski/mini.notify"
  {:opts {}
   :config (fn [_ opts]
             (let [notify (require :mini.notify)]
               (notify.setup opts)
               (set vim.notify (notify.make_notify))))})
