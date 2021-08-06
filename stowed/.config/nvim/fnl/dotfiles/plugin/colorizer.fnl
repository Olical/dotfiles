(module dotfiles.plugin.colorizer)

(let [colorizer (require :colorizer)]
  (when colorizer
    (colorizer.setup)))
