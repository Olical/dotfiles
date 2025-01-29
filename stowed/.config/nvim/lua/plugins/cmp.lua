-- [nfnl] Compiled from fnl/plugins/cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local cmp = require("cmp")
  cmp.setup({sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "buffer"}, {name = "conjure"}}), window = {completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered()}, mapping = cmp.mapping.preset.insert({["<C-b>"] = cmp.mapping.scroll_docs(-4), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.abort(), ["<CR>"] = cmp.mapping.confirm({select = true})})})
  cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
  return cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "path"}, {name = "cmdline"}}), matching = {disallow_symbol_nonprefix_matching = false}})
end
return {"hrsh7th/nvim-cmp", config = _1_, dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "petertriho/cmp-git", "PaterJason/cmp-conjure", "Olical/conjure"}, event = "VeryLazy", main = "cmp"}
