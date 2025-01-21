(import-macros {: tx} :config.macros)

(tx "navarasu/onedark.nvim"
  {:opts {:style "darker"}
   :config (fn [_ opts]
	     (let [onedark (require :onedark)]
	       (onedark.setup opts)
	       (onedark.load)))})
