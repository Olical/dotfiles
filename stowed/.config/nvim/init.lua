-- [nfnl] init.fnl
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.foldenable = false
vim.o.undofile = true
vim.o.spell = true
vim.o.termguicolors = true
local function toggle_diagnostic_lines()
  local _1_
  if vim.diagnostic.config().virtual_lines then
    _1_ = false
  else
    _1_ = {current_line = true}
  end
  return vim.diagnostic.config({virtual_lines = _1_})
end
local function toggle_diagnostic_text()
  return vim.diagnostic.config({virtual_text = not vim.diagnostic.config().virtual_text})
end
vim.diagnostic.config({virtual_text = true, virtual_lines = false})
vim.keymap.set("n", "<leader>tdl", toggle_diagnostic_lines, {desc = "Toggle diagnostic virtual lines."})
vim.keymap.set("n", "<leader>tdt", toggle_diagnostic_text, {desc = "Toggle diagnostic virtual text."})
vim.keymap.set("n", "\\", ",")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>q", "<CMD>quit<CR>", {desc = ":quit"})
vim.keymap.set("n", "\\", "<CMD>split<CR>", {desc = ":split"})
vim.keymap.set("n", "|", "<CMD>vsplit<CR>", {desc = ":vsplit"})
vim.keymap.set("n", "<leader>bw", "<CMD>w<CR>", {desc = "Write the buffer"})
vim.keymap.set("n", "<leader>sc", "<CMD>nohlsearch<CR>", {desc = "Clear search highlight"})
return require("config.lazy")
