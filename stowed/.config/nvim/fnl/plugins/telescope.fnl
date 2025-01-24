(import-macros {: tx} :config.macros)

(tx "nvim-telescope/telescope.nvim"
  {:opts {}
   :tag "0.1.8"
   :dependencies ["nvim-lua/plenary.nvim"]
   :cmd "Telescope"
   :keys [(tx "<leader>ff" "<CMD>Telescope find_files<cr>"
            {:desc "Find files"})
          (tx "<leader>fg" "<CMD>Telescope live_grep<cr>"
            {:desc "Find grep"})
          (tx "<leader>fb" "<CMD>Telescope buffers<cr>"
            {:desc "Find buffers"})
          (tx "<leader>fh" "<CMD>Telescope help_tags<cr>"
            {:desc "Find help tags"})
          (tx "<leader>fc" "<CMD>Telescope commands<cr>"
            {:desc "Find commands"})]})
