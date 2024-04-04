(local uu (require :dotfiles.util))

[(uu.tx
   :zbirenbaum/copilot.lua
   {:cmd "Copilot"
    :event "InsertEnter"
    :config (fn []
              (let [copilot (require :copilot)]
                (copilot.setup
                  {:panel {:auto_refresh true}
                   :suggestion {:auto_trigger true}})))})]
