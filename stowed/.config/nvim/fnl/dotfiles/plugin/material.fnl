(module dotfiles.plugin.material
  {autoload {nvim aniseed.nvim
             material material}})

(material.setup
  {:custom_highlights {:FloatBorder "#1A1A1A"}
   :borders true
   :high_visibility {:darker true}})

(set nvim.g.material_style :darker)
(nvim.ex.colorscheme :material)
