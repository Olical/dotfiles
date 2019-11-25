(local nvim (require :aniseed.nvim))
(local nu (require :aniseed.nvim.util))

(fn expand [s]
  (nvim.fn.expand s))

(fn filename []
  (let [tail (expand "%:t")]
    (if (= "" tail)
      ""
      (if (> (nvim.fn.winwidth 0) 70)
        (.. (expand "%:p:h:t") "/" tail)
        tail))))

(fn readonly []
  (if (and nvim.bo.readonly
           (not= nvim.bo.filetype "help"))
    "RO"
    ""))

(fn bridge [from to]
  (nu.fn-bridge from :config.module.plugin.lightline to {:return true}))

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

{:filename filename
 :readonly readonly}
