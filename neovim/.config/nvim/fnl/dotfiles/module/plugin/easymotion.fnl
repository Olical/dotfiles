(module dotfiles.module.plugin.easymotion
  {require {nvim aniseed.nvim}})

(nvim.set_keymap "" :<leader>j "<plug>(easymotion-prefix)" {})
