-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local notify = require("mini.notify")
  notify.setup(opts)
  vim.notify = notify.make_notify()
  return nil
end
return {"echasnovski/mini.notify", config = _1_, opts = {}}
