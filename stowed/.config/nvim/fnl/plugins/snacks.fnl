(import-macros {: tx} :config.macros)

(tx
  "folke/snacks.nvim"
  {:lazy false
   :priority 1000

   :opts
   {:picker {:enabled true}
    :image {:enabled true}
    :input {:enabled true}
    :lazygit {:enabled true}
    :notifier {:enabled true}}

   :keys
   [(tx "<leader><leader>" #(Snacks.picker.smart) {:desc "Smart find files"})
    (tx "<leader>ff" #(Snacks.picker.files) {:desc "Find Files"})
    (tx "<leader>fg" #(Snacks.picker.grep) {:desc "Find Grep"})
    (tx "<leader>fb" #(Snacks.picker.buffers) {:desc "Find Buffers"})
    (tx "<leader>fh" #(Snacks.picker.help) {:desc "Find Help"})
    (tx "<leader>fc" #(Snacks.picker.commands) {:desc "Find Commands"})
    (tx "<leader>fr" #(Snacks.picker.recent) {:desc "Find Recent"})
    (tx "<leader>fk" #(Snacks.picker.keymaps) {:desc "Find Keymaps"})
    (tx "<leader>fu" #(Snacks.picker.undo) {:desc "Find Undo"})
    (tx "<leader>fs" #(Snacks.picker.spelling) {:desc "Find Spelling"})
    (tx "<leader>fn" #(Snacks.picker.notifications) {:desc "Find Notifications"})

    (tx "<leader>ld" #(Snacks.picker.lsp_definitions) {:desc "Go to Definition"})
    (tx "<leader>lD" #(Snacks.picker.lsp_declarations) {:desc "Go to Declaration"})
    (tx "<leader>lr" #(Snacks.picker.lsp_references) {:desc "References"})
    (tx "<leader>li" #(Snacks.picker.lsp_implementations) {:desc "Implementations"})
    (tx "<leader>lt" #(Snacks.picker.lsp_type_definitions) {:desc "Type Definitions"})
    (tx "<leader>ls" #(Snacks.picker.lsp_symbols) {:desc "Document symbols"})
    (tx "<leader>lS" #(Snacks.picker.lsp_workspace_symbols) {:desc "Workspace symbols"})

    (tx "<leader>gg" #(Snacks.lazygit) {:desc "Lazygit"})

    (tx "<leader>nc" #(Snacks.notifier.hide) {:desc "Notifications Clear"})]})
