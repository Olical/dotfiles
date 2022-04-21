(module dotfiles.plugin.lualine)

(let [(ok? lualine) (pcall require :lualine)]
  (when ok?
    (lualine.setup)))
