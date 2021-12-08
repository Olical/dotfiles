(module dotfiles.plugin.better-default
  {autoload {nvim aniseed.nvim}})

(set nvim.g.vim_better_default_persistent_undo true)
(nvim.ex.runtime_ "plugin/default.vim")

(nvim.ex.set :nonumber)
(nvim.ex.set :norelativenumber)
(nvim.ex.set :wrap)
(nvim.ex.set :nocursorline)
(nvim.ex.set "wildmode=full")
(nvim.ex.set "wildoptions=pum")
(nvim.ex.set "listchars-=eol:↵")

(set nvim.o.undodir (.. (nvim.fn.stdpath "data") "/undo"))

(nvim.ex.set "clipboard-=unnamedplus")

(nvim.ex.tunmap :<space>wh)
(nvim.ex.tunmap :<space>wj)
(nvim.ex.tunmap :<space>wk)
(nvim.ex.tunmap :<space>wl)
