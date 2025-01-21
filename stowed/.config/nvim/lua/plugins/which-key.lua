-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local tmp_9_auto = require("which-key")
  tmp_9_auto:show({global = false})
  return tmp_9_auto
end
return {"folke/which-key.nvim", keys = {{"<leader>?", _1_, desc = "Buffer Local Keymaps (which-key)"}}, opts = {}}
