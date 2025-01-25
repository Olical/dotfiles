-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.keymap.set("n", "\\", ",")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", {desc = ":quit"})
vim.keymap.set("n", "\\", "<CMD>split<CR>", {desc = ":split"})
vim.keymap.set("n", "|", "<CMD>vsplit<CR>", {desc = ":vsplit"})
vim.keymap.set("n", "<leader>sc", "<CMD>nohlsearch<CR>", {desc = "Clear search highlight"})
return require("config.lazy")
