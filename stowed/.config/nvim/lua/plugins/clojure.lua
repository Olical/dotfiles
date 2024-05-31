-- [nfnl] Compiled from fnl/plugins/clojure.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("astrocore")
local uu = require("dotfiles.util")
local function _1_(_, opts)
  opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {"clojure_lsp"})
  return nil
end
local function _2_()
  vim.g["conjure#eval#result_register"] = "*"
  vim.g["conjure#log#botright"] = true
  vim.g["conjure#mapping#doc_word"] = "gk"
  vim.g["conjure#client#clojure#nrepl#refresh#backend"] = "clj-reload"
  local function _3_()
    vim.bo.commentstring = ";; %s"
    return nil
  end
  return vim.api.nvim_create_autocmd("FileType", {callback = _3_, desc = "Lisp style line comment", group = vim.api.nvim_create_augroup("comment_config", {clear = true}), pattern = {"clojure"}})
end
local function _4_()
  local cmp = require("cmp")
  local config = cmp.get_config()
  table.insert(config.sources, {name = "conjure"})
  return cmp.setup(config)
end
return {uu.tx("clojure-vim/vim-jack-in", {ft = "clojure", cmd = "Clj", lazy = true}), uu.tx("williamboman/mason-lspconfig.nvim", {opts = _1_}), uu.tx("Olical/conjure", {dev = uu["dev?"]("conjure"), lazy = true, ft = {"clojure", "fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp", "python", "rust", "sql"}, dependencies = {"Olical/AnsiEsc", "PaterJason/cmp-conjure"}, init = _2_}), uu.tx("Olical/AnsiEsc", {dev = uu["dev?"]("AnsiEsc"), lazy = true}), uu.tx("PaterJason/cmp-conjure", {lazy = true, config = _4_})}
