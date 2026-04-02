-- [nfnl] Compiled from fnl/config/sync.fnl by https://github.com/Olical/nfnl, do not edit.
vim.api.nvim_create_autocmd("User", {
  pattern = "LazySync",
  once = true,
  callback = function()
    local task = require("nvim-treesitter.install").update()
    return task:await(function()
      return vim.cmd("quitall")
    end)
  end
})
local lazy = require("lazy")
return lazy.sync({show = false})
