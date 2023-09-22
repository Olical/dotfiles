-- [nfnl] Compiled from plugins/parens.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
local fun = require("user.vendor.fun")
local lisps = {"scheme", "lisp", "clojure", "fennel"}
local function _1_()
  local autopairs = require("nvim-autopairs")
  do end (fun.head(autopairs.get_rules("'")))["not_filetypes"] = lisps
  fun.head(autopairs.get_rules("`"))["not_filetypes"] = lisps
  return autopairs.setup({ignored_next_char = "", enable_check_bracket_line = false})
end
local function _2_()
  local paredit = require("nvim-paredit")
  local paredit_fennel = require("nvim-paredit-fennel")
  local function _3_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _4_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  local function _5_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _6_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  paredit.setup({keys = {["<A-H>"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<A-J>"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<A-K>"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<A-L>"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<localleader>w"] = {_3_, "Wrap element insert head"}, ["<localleader>W"] = {_4_, "Wrap element insert tail"}, ["<localleader>i"] = {_5_, "Wrap form insert head"}, ["<localleader>I"] = {_6_, "Wrap form insert tail"}}})
  return paredit_fennel.setup()
end
return {uu.tx("windwp/nvim-autopairs", {init = _1_}), uu.tx("julienvincent/nvim-paredit", {dependencies = {"julienvincent/nvim-paredit-fennel"}, ft = {"clojure", "scheme", "lisp", "timl", "fennel", "janet"}, config = _2_})}
