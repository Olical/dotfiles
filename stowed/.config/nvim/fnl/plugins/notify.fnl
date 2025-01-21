(import-macros {: tx} :config.macros)

(tx "rcarriga/nvim-notify"
  {:opts {}
   :config (fn [_ opts]
             (let [notify (require :notify)]
               (notify.setup opts)
               (set vim.notify notify)))})
