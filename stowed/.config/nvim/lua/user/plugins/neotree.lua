local uu = require("user.util")
return uu.tx("nvim-neo-tree/neo-tree.nvim", {opts = {filesystem = {filtered_items = {hide_by_pattern = {"/home/*/.config/nvim/lua/user/**.lua"}}}}})
