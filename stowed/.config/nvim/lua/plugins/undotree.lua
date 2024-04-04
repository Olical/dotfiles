-- [nfnl] Compiled from fnl/plugins/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
return uu.tx("mbbill/undotree", {keys = {uu.tx("<leader>z", ":UndotreeShow<cr>:UndotreeFocus<cr>", {desc = "Open Undotree"})}})
