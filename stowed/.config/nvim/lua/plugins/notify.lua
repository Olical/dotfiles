-- [nfnl] Compiled from fnl/plugins/notify.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local notify = require("notify")
  notify.setup(opts)
  vim.notify = notify
  return nil
end
local function _2_()
  local tmp_9_auto = require("notify")
  tmp_9_auto:dismiss()
  return tmp_9_auto
end
return {"rcarriga/nvim-notify", config = _1_, event = "VeryLazy", keys = {{"<leader>nd", _2_}, {"<leader>fn", "<CMD>Telescope notify<CR>"}}, opts = {}}
