-- [nfnl] fnl/plugins/ai.fnl
local function _1_()
  local avente_ext = require("mcphub.extensions.avante")
  return {avente_ext.mcp_tool()}
end
local function _2_()
  local mcphub = require("mcphub")
  local hub = mcphub.get_hub_instance()
  return ((hub and hub:get_active_servers_prompt()) or "")
end
return {{"ravitemer/mcphub.nvim", dependencies = {"nvim-lua/plenary.nvim"}, opts = {cmd = "npx", cmdArgs = {"mcp-hub"}}}, {"yetone/avante.nvim", build = "make", custom_tools = _1_, dependencies = {"nvim-treesitter/nvim-treesitter", "zbirenbaum/copilot.lua", "stevearc/dressing.nvim", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-telescope/telescope.nvim", "hrsh7th/nvim-cmp", "nvim-tree/nvim-web-devicons"}, event = "VeryLazy", opts = {provider = "copilot", hints = {enabled = false}}, system_prompt = _2_, version = false}, {"HakonHarnes/img-clip.nvim", event = "VeryLazy", opts = {default = {drag_and_drop = {insert_mode = true}, embed_image_as_base64 = false, prompt_for_file_name = false}}}, {"MeanderingProgrammer/render-markdown.nvim", ft = {"markdown", "Avante"}, opts = {file_types = {"markdown", "Avante"}}}}
