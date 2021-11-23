(module dotfiles.plugin.which-key)

(let [(ok? which-key) (pcall #(require :which-key))]
  (when ok?
    (which-key.setup {})))
