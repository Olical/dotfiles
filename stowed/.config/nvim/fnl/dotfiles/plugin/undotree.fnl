(module dotfiles.plugin.undotree
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap
  :n
  :<leader>ut
  ":UndotreeToggle<cr>"
  {:noremap true
   :silent true})
