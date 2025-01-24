(import-macros {: tx} :config.macros)

(tx "rcarriga/nvim-notify"
  {:opts {}
   :event "VeryLazy"
   :config (fn [_ opts]
             (let [notify (require :notify)]
               (notify.setup opts)
               (set vim.notify notify)))
   :keys [(tx "<leader>nd" #((. (require :notify) :dismiss) {:silent true})
            {:desc "Dismiss notifications"})
          (tx "<leader>nc" "<CMD>NotificationsClear<CR>"
            {:desc "Clear notifications"})
          (tx "<leader>fn" "<CMD>Telescope notify<CR>"
            {:desc "Find notifications"})]})
