-- [nfnl] Compiled from fnl/plugins/none-ls.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
local function _1_(_, config)
  config.sources = {}
  return config
end
return uu.tx("nvimtools/none-ls.nvim", {opts = _1_})
