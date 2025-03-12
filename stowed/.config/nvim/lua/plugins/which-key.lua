-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local wk = require("which-key")
  return wk.add({{"<leader>a", group = "AI"}, {"<leader>b", group = "Buffer"}, {"<leader>f", group = "Find"}, {"<leader>l", group = "LSP"}, {"<leader>la", group = "LSP actions"}, {"<leader>g", group = "Git"}, {"<leader>s", group = "Search"}, {"<leader>n", group = "Notifications"}, {"<leader>t", group = "Toggle"}, {"<leader>d", group = "Diffview"}})
end
return {"folke/which-key.nvim", config = _1_, event = "VeryLazy"}
