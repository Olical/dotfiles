-- [nfnl] fnl/plugins/cmp.fnl
local function _1_()
  local cmp = require("cmp")
  local copilot_cmp_comparators = require("copilot_cmp.comparators")
  cmp.setup({sources = cmp.config.sources({{name = "copilot", group_index = 2}, {name = "nvim_lsp", group_index = 2}, {name = "conjure", group_index = 2}, {name = "buffer", group_index = 2}}), sorting = {priority_weight = 2, comparators = {copilot_cmp_comparators.prioritize, cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score, cmp.config.compare.recently_used, cmp.config.compare.locality, cmp.config.compare.kind, cmp.config.compare.sort_text, cmp.config.compare.length, cmp.config.compare.order}}, window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = false})})})
  return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}, {name = "cmdline"}}), matching = {disallow_symbol_nonprefix_matching = false}})
end
return {"hrsh7th/nvim-cmp", config = _1_, dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "PaterJason/cmp-conjure", "Olical/conjure", "zbirenbaum/copilot-cmp", "olimorris/codecompanion.nvim", "nvim-lua/plenary.nvim"}, event = "VeryLazy", main = "cmp"}
