(module dotfiles.module.plugin
  {require {nvim aniseed.nvim
            core aniseed.core
            util dotfiles.util}})

;; Plugin configuration that should be loaded even if the directory doesn't
;; exist or it isn't installed according to vim-plug.
(def- always-load
  {:aniseed true
   :conjure true})

(def- data-dir (.. (nvim.fn.stdpath :data) "/plugged"))

(defn- plugin-installed? [name]
  "Checks if the plugin directory can be found in the data directory."
  (= 1 (nvim.fn.isdirectory (.. data-dir "/" name))))

(defn- find-plugin [candidate]
  "Returns the matching plugin name if the given plugin can be found within any
  of the required plugins So `deoplete` would match `deoplete.nvim`."
  (or (and (. nvim.g.plugs candidate) candidate)
      (->> (core.keys nvim.g.plugs)
           (core.some
             (fn [plug-name]
               (and (plug-name:find candidate 1 true) plug-name))))))

;; Load plugin configuration modules.
(core.run!
  (fn [path]
    (let [name (nvim.fn.fnamemodify path ":t:r")
          full-name (find-plugin name)
          bypass? (. always-load name)]
      (if (or bypass? full-name)
        (if (or bypass? (plugin-installed? full-name))
          (match (pcall require (.. "dotfiles.module.plugin." name))
            (false err) (print "Error requiring plugin module:" name "-" err))
          (print (.. "Not loading plugin module, not installed yet: " name)))
        (print (.. "Orphan plugin configuration: " name)))))
  (util.glob (.. (nvim.fn.stdpath "config") "/lua/dotfiles/module/plugin/*.lua")))
