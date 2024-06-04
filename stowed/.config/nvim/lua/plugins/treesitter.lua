-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
local function _1_(_, opts)
  opts.ensure_installed = (require("astrocore")).list_insert_unique(opts.ensure_installed, {"clojure", "fennel", "kdl", "markdown", "diff"})
  return nil
end
return uu.tx("nvim-treesitter/nvim-treesitter", {opts = _1_})
