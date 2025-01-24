;; Leader keys must be set before lazy loads.
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Ensure we can still use , through the \ key.
(vim.keymap.set "n" "\\" ",")

;; Helpful generic mappings.
(vim.keymap.set "i" "jk" "<esc>")
(vim.keymap.set "n" "<leader>q" "<CMD>:quit<CR>" {:desc ":quit"})
(vim.keymap.set "n" "\\" "<CMD>:split<CR>" {:desc ":split"})
(vim.keymap.set "n" "|" "<CMD>:vsplit<CR>" {:desc ":vsplit"})

(require :config.lazy)
