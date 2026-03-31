-- [nfnl] fnl/plugins/theme.fnl
local function _1_(_, opts)
  local monokai_pro = require("monokai-pro")
  monokai_pro.setup(opts)
  return vim.cmd.colorscheme("monokai-pro")
end
return {"loctvl842/monokai-pro.nvim", config = _1_, lazy = false, opts = {}}
