-- [nfnl] fnl/plugins/ai.fnl
local function _1_()
  local mcphub = require("mcphub")
  local hub = mcphub.get_hub_instance()
  return ((hub and hub:get_active_servers_prompt()) or "")
end
local function _2_()
  local avente_ext = require("mcphub.extensions.avante")
  return {avente_ext.mcp_tool()}
end
return {{"ravitemer/mcphub.nvim", dependencies = {"nvim-lua/plenary.nvim"}, opts = {cmd = "npx", cmdArgs = {"mcp-hub"}}}, {"yetone/avante.nvim", build = "make", dependencies = {"nvim-treesitter/nvim-treesitter", "zbirenbaum/copilot.lua", "stevearc/dressing.nvim", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-telescope/telescope.nvim", "hrsh7th/nvim-cmp", "nvim-tree/nvim-web-devicons"}, event = "VeryLazy", opts = {provider = "copilot", hints = {enabled = false}, web_search_engine = {provider = "kagi"}, system_prompt = _1_, custom_tools = _2_}, version = false}, {"HakonHarnes/img-clip.nvim", event = "VeryLazy", opts = {default = {drag_and_drop = {insert_mode = true}, embed_image_as_base64 = false, prompt_for_file_name = false}}}, {"MeanderingProgrammer/render-markdown.nvim", ft = {"markdown", "Avante"}, opts = {file_types = {"markdown", "Avante"}}}, {"zbirenbaum/copilot.lua", cmd = "Copilot", event = "VeryLazy", main = "copilot", opts = {suggestion = {enabled = false}, panel = {enabled = false}}}, {"zbirenbaum/copilot-cmp", dependencies = {"zbirenbaum/copilot.lua"}, main = "copilot_cmp", opts = {fix_pairs = false}}}
