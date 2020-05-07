(module dotfiles.module.plugin.conjure
  {require {config conjure.config}})

(config.assoc
  {:path [:eval :result-register]
   :val "*"})
