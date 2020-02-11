(module config.module.plugin.fugitive
  {require {nvim aniseed.nvim}})

(defn- nnoremap [from to]
  (nvim.set_keymap
    :n
    (.. "<leader>" from)
    (.. ":" to "<cr>")
    {:noremap true}))

(nnoremap :gs "Gstatus")
(nnoremap :gb "Gblame")
(nnoremap :gd "Gdiff")
(nnoremap :gp "Gpush")
(nnoremap :gl "Gpull")
(nnoremap :gf "Gfetch")
(nnoremap :gcc "Gcommit --verbose")
(nnoremap :gca "Gcommit --all --verbose")
(nnoremap :gdl "diffget LOCAL")
(nnoremap :gdr "diffget REMOTE")
