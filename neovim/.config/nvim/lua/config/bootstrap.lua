if not(pcall(require, "aniseed.compile")) then
  vim.api.nvim_command("PlugInstall")
end

require("aniseed.compile").glob("**/*.fnl", "fnl", "lua")
require("config")
