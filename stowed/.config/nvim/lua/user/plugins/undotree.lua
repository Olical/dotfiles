-- [nfnl] Compiled from plugins/undotree.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
return uu.tx("mbbill/undotree", {keys = {uu.tx("<leader>z", ":UndotreeShow<cr>:UndotreeFocus<cr>", {desc = "Open Undotree"})}})
