(module dotfiles.module.plugin.easymotion
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap "" :<leader>j "<plug>(easymotion-prefix)" {})
