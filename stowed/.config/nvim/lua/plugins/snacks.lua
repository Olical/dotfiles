-- [nfnl] fnl/plugins/snacks.fnl
local function _1_()
  return Snacks.picker.smart()
end
local function _2_()
  return Snacks.picker.files()
end
local function _3_()
  return Snacks.picker.grep()
end
local function _4_()
  return Snacks.picker.buffers()
end
local function _5_()
  return Snacks.picker.help()
end
local function _6_()
  return Snacks.picker.commands()
end
local function _7_()
  return Snacks.picker.recent()
end
local function _8_()
  return Snacks.picker.keymaps()
end
local function _9_()
  return Snacks.picker.undo()
end
local function _10_()
  return Snacks.picker.spelling()
end
local function _11_()
  return Snacks.picker.notifications()
end
local function _12_()
  return Snacks.picker.lsp_definitions()
end
local function _13_()
  return Snacks.picker.lsp_declarations()
end
local function _14_()
  return Snacks.picker.lsp_references()
end
local function _15_()
  return Snacks.picker.lsp_implementations()
end
local function _16_()
  return Snacks.picker.lsp_type_definitions()
end
local function _17_()
  return Snacks.picker.lsp_symbols()
end
local function _18_()
  return Snacks.picker.lsp_workspace_symbols()
end
local function _19_()
  return Snacks.lazygit()
end
local function _20_()
  return Snacks.notifier.hide()
end
return {"folke/snacks.nvim", keys = {{"<leader><leader>", _1_, desc = "Smart find files"}, {"<leader>ff", _2_, desc = "Find Files"}, {"<leader>fg", _3_, desc = "Find Grep"}, {"<leader>fb", _4_, desc = "Find Buffers"}, {"<leader>fh", _5_, desc = "Find Help"}, {"<leader>fc", _6_, desc = "Find Commands"}, {"<leader>fr", _7_, desc = "Find Recent"}, {"<leader>fk", _8_, desc = "Find Keymaps"}, {"<leader>fu", _9_, desc = "Find Undo"}, {"<leader>fs", _10_, desc = "Find Spelling"}, {"<leader>fn", _11_, desc = "Find Notifications"}, {"<leader>ld", _12_, desc = "Go to Definition"}, {"<leader>lD", _13_, desc = "Go to Declaration"}, {"<leader>lr", _14_, desc = "References"}, {"<leader>li", _15_, desc = "Implementations"}, {"<leader>lt", _16_, desc = "Type Definitions"}, {"<leader>ls", _17_, desc = "Document symbols"}, {"<leader>lS", _18_, desc = "Workspace symbols"}, {"<leader>gg", _19_, desc = "Lazygit"}, {"<leader>nc", _20_, desc = "Notifications Clear"}}, lazy = false, opts = {picker = {enabled = true}, image = {enabled = true}, input = {enabled = true}, lazygit = {enabled = true}, notifier = {enabled = true}}, priority = 1000}
