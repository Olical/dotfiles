-- [nfnl] fnl/plugins/tree-sitter.fnl
local function _1_()
  local function _2_()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    return nil
  end
  return pcall(_2_)
end
vim.api.nvim_create_autocmd("FileType", {pattern = {"*"}, callback = _1_})
return {"nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate", main = "nvim-treesitter.configs"}
