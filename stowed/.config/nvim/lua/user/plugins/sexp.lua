local uu = require("user.util")
local function _1_()
  vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"
  return nil
end
return {uu.tx("guns/vim-sexp", {init = _1_}), uu.tx("tpope/vim-sexp-mappings-for-regular-people")}
