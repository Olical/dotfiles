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
   {:branch "main"
    :event "BufEnter"
    :dependencies [:zbirenbaum/copilot.lua]
    :opts {:debug false
           :context :buffers}
    :keys [{1 "<leader>c"
            2 "<cmd>CopilotChat<cr>"
            :desc "Open Copilot Chat"}

           {1 "<leader>c"
            2 #(integrations.pick (actions.prompt_actions))
            :desc "Pick Copilot Action"
            :mode :v}]})]
