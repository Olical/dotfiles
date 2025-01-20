-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "\\", ",")
vim.o.shortmess = (vim.o.shortmess .. "at")
return require("config.lazy")
