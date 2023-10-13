-- [nfnl] Compiled from plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
local utils = uu.autoload("astronvim.utils")
local lspconfig = uu.autoload("lspconfig")
local function _1_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {"fennel_language_server"})
  local function _2_()
    return lspconfig.lua_ls.setup({settings = {Lua = {diagnostics = {globals = {"vim", "jit"}}}}})
  end
  opts.handlers.lua_ls = _2_
  local function _3_()
    return lspconfig.fennel_language_server.setup({filetypes = {"fennel"}, root_dir = lspconfig.util.root_pattern("fnl", "lua"), single_file_support = true, settings = {fennel = {diagnostics = {globals = {"vim", "jit", "comment"}}, workspace = {library = vim.api.nvim_list_runtime_paths()}}}})
  end
  opts.handlers.fennel_language_server = _3_
  return opts
end
local function _4_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {})
  return opts
end
local function _5_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {})
  do
    local dap = require("dap")
    dap.set_log_level("TRACE")
    local function _6_(cb, config)
      if ("attach" == config.request) then
        return error("Attaching to Clojure is not yet supported")
      elseif ("launch" == config.request) then
        return cb({type = "executable", command = "/home/olical/repos/Olical/clojure-dap/script/run", args = {}, options = {source_filetype = "clojure", initialize_timeout_sec = 10}})
      else
        return error(("Unknown request" .. (config.request or "nil")))
      end
    end
    dap.adapters.clojure = _6_
    dap.configurations.clojure = {{type = "clojure", request = "launch", name = "Launch Clojure DAP and attach to nREPL"}}
  end
  return opts
end
return {uu.tx("williamboman/mason-lspconfig.nvim", {opts = _1_}), uu.tx("jay-babu/mason-null-ls.nvim", {opts = _4_}), uu.tx("jay-babu/mason-nvim-dap.nvim", {opts = _5_})}
