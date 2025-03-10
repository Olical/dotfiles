-- [nfnl] Compiled from fnl/plugins/paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local paredit = autoload("nvim-paredit")
local function _2_()
  return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
end
local function _3_()
  return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("(", " )"), {placement = "inner_end", mode = "insert"})
end
local function _4_()
  return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
end
local function _5_()
  return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("(", " )"), {placement = "inner_end", mode = "insert"})
end
return {"julienvincent/nvim-paredit", event = "VeryLazy", keys = {{"<localleader>w", _2_, desc = "Wrap element insert head"}, {"<localleader>W", _3_, desc = "Wrap element insert tail"}, {"<localleader>i", _4_, desc = "Wrap form insert head"}, {"<localleader>I", _5_, desc = "Wrap form insert tail"}}, opts = {}}
