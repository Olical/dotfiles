-- [nfnl] Compiled from fnl/config/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
vim.keymap.set("n", "\\", ",")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", {desc = ":quit"})
vim.keymap.set("n", "\\", "<CMD>split<CR>", {desc = ":split"})
vim.keymap.set("n", "|", "<CMD>vsplit<CR>", {desc = ":vsplit"})
return vim.keymap.set("n", "<leader>sc", "<CMD>nohlsearch<CR>", {desc = "Clear search highlight"})
