(import-macros {: tx} :config.macros)

(local suppress
  ["No information available"])

(tx "rcarriga/nvim-notify"
  {:opts {:stages "static"
          :render "compact"
          :fps 1}
   :event "VeryLazy"
   :dependencies ["Olical/nfnl"]
   :config (fn [_ opts]
             (let [notify (require :notify)
                   core (require :nfnl.core)]
               (notify.setup opts)
               (set vim.notify
                    (fn [msg ...]
                      (if (core.some #(= $ msg) suppress)
                        nil
                        (notify msg ...))))))
   :keys [(tx "<leader>nd" #((. (require :notify) :dismiss) {:silent true})
            {:desc "Dismiss notifications"})
          (tx "<leader>nc" "<CMD>NotificationsClear<CR>"
            {:desc "Clear notifications"})
          (tx "<leader>fn" "<CMD>Telescope notify<CR>"
            {:desc "Find notifications"})]})
