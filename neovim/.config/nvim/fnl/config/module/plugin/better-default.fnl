(local nvim (require :aniseed.nvim))

(set nvim.g.vim_better_default_persistent_undo true)
(nvim.ex.runtime_ "plugin/default.vim")

;; TODO Find a way to execute this after the plugin is loaded.
(nvim.ex.set :nonumber)
(nvim.ex.set :norelativenumber)
(set nvim.o.undodir (.. (nvim.fn.stdpath "data") "/undo"))
(set nvim.o.wrap true)

(nvim.ex.set "clipboard-=unnamedplus")

(nvim.ex.tunmap :<space>wh)
(nvim.ex.tunmap :<space>wj)
(nvim.ex.tunmap :<space>wk)
(nvim.ex.tunmap :<space>wl)
