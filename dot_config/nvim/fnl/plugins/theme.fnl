(import-macros {: tx} :config.macros)

(tx "loctvl842/monokai-pro.nvim"
  {:lazy false
   :opts {}
   :config (fn [_ opts]
	     (let [monokai-pro (require :monokai-pro)]
	       (monokai-pro.setup opts)
               (vim.cmd.colorscheme :monokai-pro)))})
