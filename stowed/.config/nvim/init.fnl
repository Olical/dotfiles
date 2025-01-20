;; Leader keys must be set before lazy loads.
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Ensure we can still use , through the \ key.
(vim.keymap.set "n" "\\" ",")

(require :config.lazy)
