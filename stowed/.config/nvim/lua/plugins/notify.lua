-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local notify = require("notify")
  notify.setup(opts)
  vim.notify = notify
  return nil
end
return {"rcarriga/nvim-notify", config = _1_, opts = {}}
