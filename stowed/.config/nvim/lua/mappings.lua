-- [nfnl] Compiled from fnl/mappings.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
return {n = {["<leader>bt"] = uu.tx(":%s/\\s\\+$//e<cr>", {desc = "Delete trailing whitespace"}), ["<leader>bn"] = uu.tx(":tabnew<cr>", {desc = "Create a new tab"})}, t = {["<S-Esc>"] = uu.tx("<c-\\><c-n>", {desc = "Enter Normal mode"})}}
