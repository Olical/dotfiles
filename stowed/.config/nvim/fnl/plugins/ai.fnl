(import-macros {: tx} :config.macros)

[(tx "ravitemer/mcphub.nvim"
   {:dependencies ["nvim-lua/plenary.nvim"]
    :opts {:cmd "npx"
           :cmdArgs ["mcp-hub"]}})
 (tx "yetone/avante.nvim"
   {:event "VeryLazy"
    :version false
    :build "make"
    :opts {:provider "copilot"
           :hints {:enabled false}}
           :system_prompt (fn []
                            (let [mcphub (require :mcphub)
                                  hub (mcphub.get_hub_instance)]
                              (or (and hub (hub:get_active_servers_prompt))
                                  "")))
           :custom_tools (fn []
                           (let [avente-ext (require "mcphub.extensions.avante")]
                             [(avente-ext.mcp_tool)]))

    :dependencies ["nvim-treesitter/nvim-treesitter"
                   "zbirenbaum/copilot.lua"
                   "stevearc/dressing.nvim"
                   "nvim-lua/plenary.nvim"
                   "MunifTanjim/nui.nvim"
                   "nvim-telescope/telescope.nvim"
                   "hrsh7th/nvim-cmp"
                   "nvim-tree/nvim-web-devicons"]})
 (tx "HakonHarnes/img-clip.nvim"
   {:event "VeryLazy"
    :opts {:default {:embed_image_as_base64 false
                     :prompt_for_file_name false
                     :drag_and_drop {:insert_mode true}}}})
 (tx "MeanderingProgrammer/render-markdown.nvim"
   {:opts {:file_types ["markdown" "Avante"]}
    :ft ["markdown" "Avante"]})]
