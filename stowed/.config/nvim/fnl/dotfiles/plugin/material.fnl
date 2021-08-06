(module dotfiles.plugin.material
  {autoload {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(defn colorscheme-fixes []
  (_: hi :FloatBorder :guibg=#1A1A1A))

(augroup colorscheme_fixes
  (autocmd :ColorScheme :material (viml->fn colorscheme-fixes)))

(set nvim.g.material_style :darker)
(set nvim.g.material_borders true)
(set nvim.g.material_darker_contrast true)

(nvim.ex.colorscheme :material)
