-- [nfnl] Compiled from fnl/dotfiles/util.fnl by https://github.com/Olical/nfnl, do not edit.
local fun = require("dotfiles.vendor.fun")
local function autoload(name)
  local res = {["aniseed/autoload-enabled?"] = true, ["aniseed/autoload-module"] = false}
  local function ensure()
    if res["aniseed/autoload-module"] then
      return res["aniseed/autoload-module"]
    else
      local m = require(name)
      do end (res)["aniseed/autoload-module"] = m
      return m
    end
  end
  local function _2_(_t, ...)
    return ensure()(...)
  end
  local function _3_(_t, k)
    return ensure()[k]
  end
  local function _4_(_t, k, v)
    ensure()[k] = v
    return nil
  end
  return setmetatable(res, {__call = _2_, __index = _3_, __newindex = _4_})
end
local function last(xs)
  return fun.nth(fun.length(xs), xs)
end
local function reverse(xs)
  local len = fun.length(xs)
  local function _5_(n)
    return fun.nth((len - n), xs)
  end
  return fun.take(fun.length(xs), fun.tabulate(_5_))
end
local function dev_3f(plugin_name)
  return (1 == vim.fn.isdirectory((vim.fn.expand("~/repos/Olical") .. "/" .. plugin_name)))
end
local function tx(...)
  local args = {...}
  local len = fun.length(args)
  if ("table" == type(last(args))) then
    local function _6_(acc, n, v)
      acc[n] = v
      return acc
    end
    return fun.reduce(_6_, last(args), fun.zip(fun.range(1, len), fun.take((len - 1), args)))
  else
    return args
  end
end
return {autoload = autoload, ["dev?"] = dev_3f, tx = tx, last = last, reverse = reverse}
