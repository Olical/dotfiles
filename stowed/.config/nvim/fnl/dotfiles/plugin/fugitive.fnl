(module dotfiles.plugin.fugitive
  {autoload {util dotfiles.util}})

(util.lnnoremap :gs "Git")
(util.lnnoremap :gb "Git blame")
(util.lnnoremap :gd "Gdiff")
(util.lnnoremap :gp "Git push")
(util.lnnoremap :gl "Git pull")
(util.lnnoremap :gf "Git fetch")
(util.lnnoremap :gcc "Git commit --verbose")
(util.lnnoremap :gca "Git commit --all --verbose")
(util.lnnoremap :gdl "diffget LOCAL")
(util.lnnoremap :gdr "diffget REMOTE")
