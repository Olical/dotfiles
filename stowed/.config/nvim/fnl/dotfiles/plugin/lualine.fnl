(module dotfiles.plugin.feline)

(let [(ok? lualine) (pcall require :lualine)]
  (when ok?
    (lualine.setup)))
