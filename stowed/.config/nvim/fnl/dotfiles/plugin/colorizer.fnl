(module dotfiles.plugin.colorizer)

(let [(ok? colorizer) (pcall require :colorizer)]
  (when ok?
    (colorizer.setup)))
