-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
return uu.tx("rcarriga/nvim-notify", {opts = {render = "compact", stages = "static"}})
