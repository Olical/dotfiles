-- [nfnl] Compiled from fnl/plugins/astrolsp.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
local function _1_()
  return vim.lsp.buf.document_highlight()
end
local function _2_()
  return vim.lsp.buf.clear_references()
end
local function _3_()
  return vim.diagnostic.open_float()
end
local function _4_(_client, _bufnr)
  return nil
end
return uu.tx("AstroNvim/astrolsp", {opts = {autocmds = {lsp_document_highlight = {{callback = _1_, desc = "Document Highlighting", event = {"CursorHold", "CursorHoldI"}}, {callback = _2_, desc = "Document Highlighting Clear", event = {"CursorMoved", "CursorMovedI", "BufLeave"}}, cond = "textDocument/documentHighlight"}}, config = {}, features = {autoformat = true, codelens = true, semantic_tokens = true, inlay_hints = false}, formatting = {disabled = {}, format_on_save = {allow_filetypes = {}, enabled = true, ignore_filetypes = {}}, timeout_ms = 1000}, handlers = {}, mappings = {n = {gl = uu.tx(_3_, {desc = "Hover diagnostics"})}}, on_attach = _4_, servers = {}}})
