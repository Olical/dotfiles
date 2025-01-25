(import-macros {: tx} :config.macros)

(tx "nvim-telescope/telescope.nvim"
  {:opts {}
   :tag "0.1.8"
   :dependencies ["nvim-lua/plenary.nvim"]
   :cmd "Telescope"
   :keys [(tx "<leader>ff" "<CMD>Telescope find_files<CR>"
            {:desc "Find files"})
          (tx "<leader>fg" "<CMD>Telescope live_grep<CR>"
            {:desc "Find grep"})
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
