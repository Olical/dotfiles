if not(pcall(require, "aniseed.compile")) then
  vim.api.nvim_command("PlugInstall")
end

local dir = vim.api.nvim_call_function("stdpath", {"config"})
require("aniseed.compile").glob("**/*.fnl", dir .. "/fnl", dir .. "/lua")
require("config")
