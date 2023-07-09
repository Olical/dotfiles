-- [nfnl] Compiled from plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
return uu.tx("rcarriga/nvim-notify", {opts = {render = "compact", stages = "static"}})
