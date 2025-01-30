;;; Options
(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")
(set vim.o.ignorecase true)
(set vim.o.smartcase true)
(set vim.o.splitright true)
(set vim.o.splitbelow true)
(set vim.o.foldenable false)
(set vim.o.undofile true)

;;; Mappings

;; Renammed <localleader> to ,
;; This allows us to keep the , behaviour with a \ instead
(vim.keymap.set "n" "\\" ",")

(vim.keymap.set "i" "jk" "<esc>")
(vim.keymap.set "n" "<leader>q" "<CMD>quit<CR>" {:desc ":quit"})
(vim.keymap.set "n" "\\" "<CMD>split<CR>" {:desc ":split"})
(vim.keymap.set "n" "|" "<CMD>vsplit<CR>" {:desc ":vsplit"})

(vim.keymap.set "n" "<leader>sc" "<CMD>nohlsearch<CR>"
  {:desc "Clear search highlight"})

;;; Plugins
(require :config.lazy)
