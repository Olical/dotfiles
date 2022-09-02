(module dotfiles.plugin.autopairs)

(let [(ok? autopairs) (pcall require :nvim-autopairs)]
  (when ok?
    (autopairs.setup)))
