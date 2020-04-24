(module dotfiles.module.core
  {require {nvim aniseed.nvim}})

;; Generic Neovim configuration.
(set nvim.o.termguicolors true)
(set nvim.o.wildmenu true)
(set nvim.o.wildmode "list:longest,full")
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.pumblend 70)

(nvim.ex.set :spell)
(nvim.ex.set :list)
