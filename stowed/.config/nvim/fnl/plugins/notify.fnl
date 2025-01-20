(import-macros {: pack} :config.macros)

(pack "rcarriga/nvim-notify"
  {:opts {}
   :config (fn [_ opts]
             (let [notify (require :notify)]
               (notify.setup opts)
               (set vim.notify notify)))})
