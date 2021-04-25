(module dotfiles.module.plugin.lightline
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util}})

(defn- expand [s]
  (nvim.fn.expand s))

(defn filename []
  (expand "%"))

(defn readonly []
  (if (and nvim.bo.readonly
           (not= nvim.bo.filetype "help"))
    "RO"
    ""))

(defn- bridge [from to]
  (nu.fn-bridge from :dotfiles.module.plugin.lightline to {:return true}))

(bridge :LightlineFilename :filename)
(bridge :LightlineReadonly :readonly)

(set nvim.g.lightline
     {:colorscheme :default
      :component_function {:filename :LightlineFilename
                           :readonly :LightlineReadonly}
      :active {:left [[:mode :paste]
                      [:readonly :filename :modified]]
               :right [[:lineinfo]
                       [:percent]]}
      :inactive {:left [[:filename]]
                 :right []}})
