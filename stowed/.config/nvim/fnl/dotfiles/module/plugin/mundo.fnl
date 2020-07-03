(module dotfiles.module.plugin.mundo
  {require {nvim aniseed.nvim}})

(nvim.set_keymap
  :n
  :<leader>ut
  ":MundoToggle<cr>"
  {:noremap true
   :silent true})
