-- [nfnl] Compiled from plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
local function _1_()
  local copilot = require("copilot")
  return copilot.setup({suggestion = {enabled = false}, panel = {enabled = false}})
end
local function _2_()
  local copilot_cmp = require("copilot_cmp")
  return copilot_cmp.setup()
end
local function _3_(_, opts)
  local cmp = require("cmp")
  opts.sources = cmp.config.sources({{name = "nvim_lsp", priority = 1000}, {name = "copilot", priority = 900}, {name = "buffer", priority = 500}, {name = "path", priority = 250}})
  return nil
end
return {uu.tx("zbirenbaum/copilot.lua", {cmd = "Copilot", event = "InsertEnter", config = _1_}), uu.tx("zbirenbaum/copilot-cmp", {config = _2_}), uu.tx("hrsh7th/nvim-cmp", {opts = _3_})}
