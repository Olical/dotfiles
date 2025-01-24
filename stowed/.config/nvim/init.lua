-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "\\", ",")
vim.keymap.set({"i", "v"}, "jk", "<esc>")
vim.keymap.set("n", "<leader>q", "<CMD>:quit<CR>", {desc = ":quit"})
vim.keymap.set("n", "\\", "<CMD>:split<CR>", {desc = ":split"})
vim.keymap.set("n", "|", "<CMD>:vsplit<CR>", {desc = ":vsplit"})
return require("config.lazy")
