(local uu (require :dotfiles.util))
(local actions (uu.autoload :CopilotChat.actions))
(local integrations (uu.autoload :CopilotChat.integrations.telescope))

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
    :opts {:debug false
           :context :buffers}
    :keys [["<leader>cc" "<cmd>CopilotChat<cr>"]
           ["<leader>cp"
            (fn []
              (integrations.pick (actions.prompt_actions)))]]
    })]
