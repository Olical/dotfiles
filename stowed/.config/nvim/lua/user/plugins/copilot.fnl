(local uu (require :user.util))

[(uu.tx
   :zbirenbaum/copilot.lua
   {:cmd "Copilot"
    :event "InsertEnter"
    :config (fn []
              (let [copilot (require :copilot)]
                (copilot.setup {})))})]
