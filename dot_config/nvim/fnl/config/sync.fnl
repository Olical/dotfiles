;;; Headless sync: updates Lazy and Treesitter then quits.
;;; Mason is updated separately via the fish sync function because its
;;; async system doesn't work reliably when combined with Lazy sync.
;;; Usage: nvim --headless -c "lua require('config.sync')"

;; Wait for Lazy to finish syncing before running TS update,
;; since the plugin needs to be loaded first.
(vim.api.nvim_create_autocmd
  "User"
  {:pattern "LazySync"
   :once true
   :callback
   #(let [task ((. (require "nvim-treesitter.install") :update))]
      (task:await (fn [] (vim.cmd "quitall"))))})

;; Kick off Lazy sync (no UI in headless mode).
(let [lazy (require "lazy")]
  (lazy.sync {:show false}))
