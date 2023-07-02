local uu = require("user.util")
local fun = require("user.vendor.fun")
local lisps = {"scheme", "lisp", "clojure", "fennel"}
local function _1_()
  local autopairs = require("nvim-autopairs")
  do end (fun.head(autopairs.get_rules("'")))["not_filetypes"] = lisps
  fun.head(autopairs.get_rules("`"))["not_filetypes"] = lisps
  return nil
end
return uu.tx("windwp/nvim-autopairs", {init = _1_})
