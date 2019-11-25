;; Can't just require this directly since the Lua path hasn't been updated yet.
(local nvim (require :aniseed.nvim))
(nvim.ex.lua "require'colorizer'.setup()")
