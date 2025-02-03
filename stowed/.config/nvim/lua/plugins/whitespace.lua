-- [nfnl] Compiled from fnl/plugins/whitespace.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("whitespace-nvim").trim()
end
return {"johnfrankmorgan/whitespace.nvim", event = "VeryLazy", keys = {{"<leader>bt", _1_, desc = "Trim whitespace"}}, main = "whitespace-nvim", opts = {}}
