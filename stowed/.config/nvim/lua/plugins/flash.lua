-- [nfnl] Compiled from fnl/plugins/flash.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local tmp_9_auto = require("flash")
  tmp_9_auto:jump()
  return tmp_9_auto
end
local function _2_()
  local tmp_9_auto = require("flash")
  tmp_9_auto:treesitter()
  return tmp_9_auto
end
local function _3_()
  local tmp_9_auto = require("flash")
  tmp_9_auto:remote()
  return tmp_9_auto
end
local function _4_()
  local tmp_9_auto = require("flash")
  tmp_9_auto:treesitter_search()
  return tmp_9_auto
end
return {"folke/flash.nvim", event = "VeryLazy", keys = {{"s", _1_, desc = "Flash", mode = {"n", "x", "o"}}, {"gs", _2_, desc = "Flash Treesitter", mode = {"n", "x", "o"}}, {"r", _3_, desc = "Remote Flash", mode = "o"}, {"R", _4_, desc = "Treesitter Search", mode = {"o", "x"}}}, opts = {modes = {search = {enabled = true}}}}
