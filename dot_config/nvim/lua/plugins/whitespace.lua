-- [nfnl] fnl/plugins/whitespace.fnl
local function _1_()
  return require("whitespace-nvim").trim()
end
return {"johnfrankmorgan/whitespace.nvim", event = "VeryLazy", keys = {{"<leader>bt", _1_, desc = "Trim whitespace"}}, main = "whitespace-nvim", opts = {}}
