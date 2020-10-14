(module dotfiles.module.plugin.srcery
  {require {nvim aniseed.nvim}
   require-macros [dotfiles.macros]})

(defn colorscheme-fixes []
  (_: hi :SpellBad :gui=underline)
  (_: hi :SpellLocal :gui=underline)
  (_: hi :SpellRare :gui=underline))

(augroup srcery_colorscheme_fixes
  (autocmd :ColorScheme :srcery (viml->fn colorscheme-fixes)))

(_: colorscheme :srcery)
