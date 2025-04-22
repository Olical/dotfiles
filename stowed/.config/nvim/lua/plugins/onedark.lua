-- [nfnl] fnl/plugins/onedark.fnl
local function _1_(_, opts)
  local onedark = require("onedark")
  onedark.setup(opts)
  return onedark.load()
end
return {"navarasu/onedark.nvim", config = _1_, opts = {style = "darker"}}
