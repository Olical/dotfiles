;; Leader keys must be set before lazy loads.
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

;; Ensure we can still use , through \.
(vim.keymap.set "n" "\\" ",")

(set vim.o.shortmess (.. vim.o.shortmess "at"))

(require :config.lazy)
