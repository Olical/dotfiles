-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local notify = require("notify")
  notify.setup(opts)
  vim.notify = notify
  return nil
end
local function _2_()
  return require("notify").dismiss({silent = true})
end
return {"rcarriga/nvim-notify", config = _1_, event = "VeryLazy", keys = {{"<leader>nd", _2_, desc = "Dismiss notifications"}, {"<leader>nc", "<CMD>NotificationsClear<CR>", desc = "Clear notifications"}, {"<leader>fn", "<CMD>Telescope notify<CR>", desc = "Find notifications"}}, opts = {}}
