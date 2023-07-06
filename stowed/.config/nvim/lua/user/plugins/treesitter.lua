-- [nfnl] Compiled from plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
local function _1_(_, opts)
  opts.ensure_installed = (require("astronvim.utils")).list_insert_unique(opts.ensure_installed, {"clojure", "fennel"})
  return nil
end
return uu.tx("nvim-treesitter/nvim-treesitter", {opts = _1_})
