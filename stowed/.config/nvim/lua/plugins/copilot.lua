-- [nfnl] Compiled from fnl/plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
local actions = uu.autoload("CopilotChat.actions")
local integrations = uu.autoload("CopilotChat.integrations.telescope")
local function _1_()
  local copilot = require("copilot")
  return copilot.setup({panel = {auto_refresh = true}, suggestion = {auto_trigger = true}})
end
local function _2_()
  return integrations.pick(actions.prompt_actions())
end
return {uu.tx("zbirenbaum/copilot.lua", {cmd = "Copilot", event = "BufEnter", config = _1_}), uu.tx("CopilotC-Nvim/CopilotChat.nvim", {branch = "canary", event = "BufEnter", dependencies = {"zbirenbaum/copilot.lua"}, opts = {context = "buffers", debug = false}, keys = {{"<leader>cc", "<cmd>CopilotChat<cr>"}, {"<leader>cp", _2_}}})}
