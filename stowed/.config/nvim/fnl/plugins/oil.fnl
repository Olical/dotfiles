(import-macros {: pack} :config.macros)

(pack "stevearc/oil.nvim"
  {:opts {:columns [;; "permissions" "size" "mtime"
                    "icon"]
          :view_options {:show_hidden false}}
   :config (fn [_ opts]
             (let [oil (require :oil)]
               (oil.setup opts)

               ;; Open Oil by default if we don't specify a file at the CLI.
               (when (= "" (vim.fn.expand "%"))
                 (oil.open))))
   :lazy false
   :keys [(doto ["-" "<CMD>Oil<CR>"]
	    (tset :desc "Open parent directory"))]
   :dependencies [(pack "echasnovski/mini.icons" {:opts {}})]})
