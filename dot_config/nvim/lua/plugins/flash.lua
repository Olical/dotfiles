-- [nfnl] fnl/plugins/flash.fnl
local function _1_()
  local tmp_9_ = require("flash")
  tmp_9_:jump()
  return tmp_9_
end
local function _2_()
  local tmp_9_ = require("flash")
  tmp_9_:treesitter()
  return tmp_9_
end
local function _3_()
  local tmp_9_ = require("flash")
  tmp_9_:remote()
  return tmp_9_
end
local function _4_()
  local tmp_9_ = require("flash")
  tmp_9_:treesitter_search()
  return tmp_9_
end
return {"folke/flash.nvim", event = "VeryLazy", keys = {{"s", _1_, desc = "Flash", mode = {"n", "x", "o"}}, {"gs", _2_, desc = "Flash Treesitter", mode = {"n", "x", "o"}}, {"r", _3_, desc = "Remote Flash", mode = "o"}, {"R", _4_, desc = "Treesitter Search", mode = {"o", "x"}}}, opts = {modes = {search = {enabled = false}}}}
