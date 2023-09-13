-- [nfnl] Compiled from plugins/parens.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("user.util")
local function _1_()
  local paredit = require("nvim-paredit")
  local paredit_fennel = require("nvim-paredit-fennel")
  local parpar = require("parpar")
  local function _2_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _3_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  local function _4_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _5_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  parpar.setup({paredit = {keys = {["<A-H>"] = {paredit.api.slurp_backwards, "Slurp backwards"}, ["<A-J>"] = {paredit.api.barf_backwards, "Barf backwards"}, ["<A-K>"] = {paredit.api.barf_forwards, "Barf forwards"}, ["<A-L>"] = {paredit.api.slurp_forwards, "Slurp forwards"}, ["<localleader>w"] = {_2_, "Wrap element insert head"}, ["<localleader>W"] = {_3_, "Wrap element insert tail"}, ["<localleader>i"] = {_4_, "Wrap form insert head"}, ["<localleader>I"] = {_5_, "Wrap form insert tail"}}}})
  return paredit_fennel.setup()
end
return {uu.tx("dundalek/parpar.nvim", {dependencies = {"gpanders/nvim-parinfer", "julienvincent/nvim-paredit-fennel", "julienvincent/nvim-paredit"}, ft = {"clojure", "scheme", "lisp", "timl", "fennel", "janet"}, config = _1_})}
