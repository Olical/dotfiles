local uu = require("user.util")
local utils = uu.autoload("astronvim.utils")
local lspconfig = uu.autoload("lspconfig")
local lspcfgs = uu.autoload("lspconfig.configs")
local function _1_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {"fennel_language_server"})
  local function _2_()
    return lspconfig.lua_ls.setup({settings = {Lua = {diagnostics = {globals = {"vim"}}}}})
  end
  opts.handlers.lua_ls = _2_
  local function _3_()
    lspcfgs.fennel_language_server = {default_config = {filetypes = {"fennel"}, root_dir = lspconfig.util.root_pattern("fnl"), single_file_support = true, settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}}}
    return nil
  end
  opts.handlers.fennel_language_server = _3_
  return nil
end
local function _4_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {})
  return nil
end
local function _5_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {})
  return nil
end
return {uu.tx("williamboman/mason-lspconfig.nvim", {opts = _1_}), uu.tx("jay-babu/mason-null-ls.nvim", {opts = _4_}), uu.tx("jay-babu/mason-nvim-dap.nvim", {opts = _5_})}
