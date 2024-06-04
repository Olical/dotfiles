(local uu (require :dotfiles.util))

[(uu.tx
   :zbirenbaum/copilot.lua
   {:cmd "Copilot"
    :event "BufEnter"
    :config (fn []
              (let [copilot (require :copilot)]
                (copilot.setup
                  {:panel {:auto_refresh true}
                   :suggestion {:auto_trigger true}})))})

 (uu.tx
   :CopilotC-Nvim/CopilotChat.nvim
   {:branch "canary"
    :event "BufEnter"
    :dependencies [:zbirenbaum/copilot.lua]
    :opts {:debug false}})]
