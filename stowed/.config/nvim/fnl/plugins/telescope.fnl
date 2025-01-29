(import-macros {: tx} :config.macros)

(tx "nvim-telescope/telescope.nvim"
  {:tag "0.1.8"
   :dependencies ["nvim-lua/plenary.nvim"
                  (tx "nvim-telescope/telescope-fzf-native.nvim" {:build "make"})]
   :opts {:defaults
           {:vimgrep_arguments
            ["rg" "--color=never" "--no-heading"
             "--with-filename" "--line-number" "--column"
             "--smart-case" "--hidden" "--glob=!.git/"]}}
   :config (fn [_ opts]
             (let [telescope (require :telescope)]
               (telescope.setup opts)
               (telescope.load_extension :fzf)))
   :cmd "Telescope"
   :keys [(tx "<leader>ff" "<CMD>Telescope git_files<CR>"
            {:desc "Find files"})
          (tx "<leader>fF" "<CMD>Telescope find_files hidden=true<CR>"
            {:desc "Find all files"})
          (tx "<leader>fg" "<CMD>Telescope live_grep<CR>"
            {:desc "Find grep"})
          (tx "<leader>fw" "<CMD>Telescope grep_string<CR>"
            {:desc "Grep string under cursor"})
          (tx "<leader>fb" "<CMD>Telescope buffers<CR>"
            {:desc "Find buffers"})
          (tx "<leader>fh" "<CMD>Telescope help_tags<CR>"
            {:desc "Find help tags"})
          (tx "<leader>fc" "<CMD>Telescope commands<CR>"
            {:desc "Find commands"})
          (tx "<leader>fo" "<CMD>Telescope oldfiles<CR>"
            {:desc "Find recent files"})
          (tx "<leader>fk" "<CMD>Telescope keymaps<CR>"
            {:desc "Find keymaps"})]})
