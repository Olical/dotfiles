(module dotfiles.module.plugin.conjure
  {require {config conjure.config}})

(config.assoc
  {:path [:eval :result-register]
   :val "*"})

(config.assoc
  {:path [:which-key :var]
   :val :which_key_maplocal})
