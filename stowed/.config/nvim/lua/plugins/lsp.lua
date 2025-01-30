-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local lsps = {"clojure_lsp", "fennel_language_server", "lua_ls", "jsonls", "yamlls", "marksman", "html", "basedpyright", "ts_ls", "terraformls", "tailwindcss", "dockerls", "docker_compose_language_service", "bashls", "taplo", "sqlls"}
local function _1_()
  local lspconfig = require("lspconfig")
  local caps = require("cmp_nvim_lsp").default_capabilities()
  local mlsp = require("mason-lspconfig")
  local function _2_(server_name)
    return require("lspconfig")[server_name].setup({capabilities = caps})
  end
  local function _3_()
    return lspconfig.fennel_language_server.setup({capabilities = caps, root_dir = lspconfig.util.root_pattern("fnl"), single_file_support = true, settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}, diagnostics = {globals = {"vim"}}}}})
  end
  return mlsp.setup_handlers({_2_, fennel_language_server = _3_})
end
return {{"williamboman/mason.nvim", event = "VeryLazy", opts = {}}, {"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, event = "VeryLazy", opts = {ensure_installed = lsps, automatic_installation = true}}, {"neovim/nvim-lspconfig", config = _1_, dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp"}, keys = {{"<leader>ld", "<CMD>Telescope lsp_definitions<CR>", desc = "LSP definition"}, {"<leader>lu", "<CMD>Telescope lsp_implementations<CR>", desc = "LSP implementations"}, {"<leader>lt", "<CMD>Telescope lsp_type_definitions<CR>", desc = "LSP type definitions"}, {"<leader>lr", "<CMD>Telescope lsp_references<CR>", desc = "LSP references"}, {"<leader>li", "<CMD>Telescope lsp_incoming_calls<CR>", desc = "LSP incoming calls"}, {"<leader>lo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "LSP outgoing calls"}, {"<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", desc = "LSP document symbols"}, {"<leader>lS", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "LSP workspace symbols"}, {"<leader>lx", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "LSP dynamic workspace symbols (all workspaces)"}, {"<leader>laf", vim.lsp.buf.format, desc = "LSP format"}, {"<leader>lar", vim.lsp.buf.rename, desc = "LSP rename"}}, lazy = false}, {"RubixDev/mason-update-all", cmd = "MasonUpdateAll", dependencies = {"williamboman/mason.nvim"}, main = "mason-update-all", opts = {}}}
