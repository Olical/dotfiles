(local uu (require :user.util))

[(uu.tx
   :zbirenbaum/copilot.lua
   {:cmd "Copilot"
    :event "InsertEnter"
    :config (fn []
              (let [copilot (require :copilot)]
                (copilot.setup {:suggestion {:enabled false}
                                :panel {:enabled false}})))})
 (uu.tx
   :zbirenbaum/copilot-cmp
   {:config (fn []
              (let [copilot-cmp (require :copilot_cmp)]
                (copilot-cmp.setup)))})
 (uu.tx
  :hrsh7th/nvim-cmp
  {:opts (fn [_ opts]
           (let [cmp (require :cmp)]
             (set opts.sources
                  (cmp.config.sources
                    [{:name "nvim_lsp"
                      :priority 1000}
                     {:name "copilot"
                      :priority 900}
                     {:name "buffer"
                      :priority 500}
                     {:name "path"
                      :priority 250}]))))})]
