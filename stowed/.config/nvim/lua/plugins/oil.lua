-- [nfnl] Compiled from fnl/plugins/oil.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local oil = require("oil")
  oil.setup(opts)
  if ("" == vim.fn.expand("%")) then
    return vim.schedule(oil.open)
  else
    return nil
  end
end
local function _3_(...)
  local tmp_9_auto = {"-", "<CMD>Oil<CR>"}
  tmp_9_auto["desc"] = "Open parent directory"
  return tmp_9_auto
end
return {"stevearc/oil.nvim", config = _1_, dependencies = {{"echasnovski/mini.icons", opts = {}}}, keys = {_3_(...)}, lazy = false, opts = {columns = {"icon"}, view_options = {show_hidden = false}}}
