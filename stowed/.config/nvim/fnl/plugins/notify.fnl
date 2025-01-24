(import-macros {: tx} :config.macros)

(tx "rcarriga/nvim-notify"
  {:opts {}
   :event "VeryLazy"
   :config (fn [_ opts]
             (let [notify (require :notify)]
               (notify.setup opts)
               (set vim.notify notify)))
   :keys [(tx "<leader>nd" #(doto (require :notify) (: :dismiss)))
          (tx "<leader>fn" "<CMD>Telescope notify<CR>")]})
