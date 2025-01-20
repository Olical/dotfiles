(import-macros {: pack} :config.macros)

(pack "stevearc/oil.nvim"
  {:opts {}
   :keys [(doto ["-" "<CMD>Oil<CR>"]
	    (tset :desc "Open parent directory"))]
   :dependencies [(pack "echasnovski/mini.icons" {:opts {}})]})
