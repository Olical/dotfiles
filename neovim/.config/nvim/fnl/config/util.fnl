(local nvim (require :aniseed.nvim))

(fn expand [path]
  (nvim.fn.expand path))

(fn glob [path]
  (nvim.fn.glob path true true true))

(fn exists? [path]
  (nvim.fn.filereadable path))

(fn lua-file [path]
  (nvim.ex.luafile path))

{:aniseed/module :config.util
 :expand expand
 :glob glob
 :exists? exists?
 :lua-file lua-file
 :config-path (nvim.fn.stdpath "config")}
