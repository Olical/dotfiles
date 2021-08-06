(module dotfiles.plugin.lualine)

(let [lualine (require :lualine)]
  (when lualine
    (lualine.setup
      {:options {:theme "material-nvim"}})))
