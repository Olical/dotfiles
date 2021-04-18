(module dotfiles.module.plugin.undotree
  {require {nvim aniseed.nvim}})

(nvim.set_keymap
  :n
  :<leader>ut
  ":UndotreeToggle<cr>"
  {:noremap true
   :silent true})
