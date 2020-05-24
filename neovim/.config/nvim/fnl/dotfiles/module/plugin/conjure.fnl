(module dotfiles.module.plugin.conjure
  {require {config conjure.config}})

(defn- cfg [path val]
  (config.assoc
    {:path path
     :val val}))

(cfg [:eval :result-register] "*")
(cfg [:which-key :var] :which_key_maplocal)
(cfg [:log :botright?] true)
