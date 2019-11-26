;; Can't just require this directly since the Lua path hasn't been updated yet.
(local nvim (require :aniseed.nvim))

;; TODO Find a way to execute this after the plugin is loaded.
(nvim.ex.lua "require('colorizer').setup()")
