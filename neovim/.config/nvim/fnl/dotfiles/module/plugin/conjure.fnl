(module dotfiles.module.plugin.conjure
  {require {config conjure.config}})

(defn- cfg [path val]
  (config.assoc
    {:path path
     :val val}))

(cfg [:eval :result-register] "*")
(cfg [:log :botright?] true)
