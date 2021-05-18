(module dotfiles.plugin.undotree
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap
  :n
  :<leader>ut
  ":UndotreeShow<cr>:UndotreeFocus<cr>"
  {:noremap true
   :silent true})
