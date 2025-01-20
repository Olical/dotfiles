(import-macros {: pack} :config.macros)

(pack "navarasu/onedark.nvim"
  {:opts {:style "darker"}
   :config (fn [_ opts]
	     (let [onedark (require :onedark)]
	       (onedark.setup opts)
	       (onedark.load)))})
