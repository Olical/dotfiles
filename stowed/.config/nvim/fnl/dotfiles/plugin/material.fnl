(module dotfiles.plugin.material
  {autoload {nvim aniseed.nvim}})

(let [(ok? material) (pcall #(require :material))]
  (when ok?
    (material.setup
      {:custom_highlights {:FloatBorder {:fg "#1A1A1A"}}
       :borders true
       :high_visibility {:darker true}})

    (set nvim.g.material_style :darker)
    (nvim.ex.colorscheme :material)))
