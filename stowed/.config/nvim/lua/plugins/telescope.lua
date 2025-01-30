-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local telescope = require("telescope")
  telescope.setup(opts)
  telescope.load_extension("fzf")
  return telescope.load_extension("undo")
end
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", config = _1_, dependencies = {"nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, keys = {{"<leader>ff", "<CMD>Telescope git_files<CR>", desc = "Find files"}, {"<leader>fF", "<CMD>Telescope find_files hidden=true<CR>", desc = "Find all files"}, {"<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Find grep"}, {"<leader>fw", "<CMD>Telescope grep_string<CR>", desc = "Grep string under cursor"}, {"<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers"}, {"<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Find help tags"}, {"<leader>fc", "<CMD>Telescope commands<CR>", desc = "Find commands"}, {"<leader>fo", "<CMD>Telescope oldfiles<CR>", desc = "Find recent files"}, {"<leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Find keymaps"}, {"<leader>fu", "<CMD>Telescope undo<CR>", desc = "Find undo"}, {"<leader>fs", "<CMD>Telescope spell_suggest<CR>", desc = "Find spelling"}}, opts = {extensions = {undo = {}}, defaults = {vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--glob=!.git/"}}}, tag = "0.1.8"}
