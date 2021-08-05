(module dotfiles.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed :all
   :highlight {:enable true
               :additional_vim_regex_highlighting false}})
