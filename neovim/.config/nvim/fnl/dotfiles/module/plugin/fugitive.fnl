(module dotfiles.module.plugin.fugitive
  {require {util dotfiles.util}})

(util.nnoremap :gs "Gstatus")
(util.nnoremap :gb "Gblame")
(util.nnoremap :gd "Gdiff")
(util.nnoremap :gp "Gpush")
(util.nnoremap :gl "Gpull")
(util.nnoremap :gf "Gfetch")
(util.nnoremap :gcc "Gcommit --verbose")
(util.nnoremap :gca "Gcommit --all --verbose")
(util.nnoremap :gdl "diffget LOCAL")
(util.nnoremap :gdr "diffget REMOTE")
