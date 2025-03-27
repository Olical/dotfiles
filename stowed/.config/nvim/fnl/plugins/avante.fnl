(import-macros {: tx} :config.macros)

[(tx "yetone/avante.nvim"
   {:event "VeryLazy"
    :version false
    :build "make"
    :opts {:provider "copilot"}
           ; :provider "openai"
           ; :openai {:endpoint "https://api.openai.com/v1"
           ;          :model "gpt-4o"
           ;          :timeout 30000
           ;          :temperature 0
           ;          :max_tokens 8192
           ;          ; :reasoning_effort "medium"

    :dependencies ["zbirenbaum/copilot.lua"
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
