(local nvim (require :aniseed.nvim))
(local compile (require :aniseed.compile))
(local util (require :config.util))

;; Compile and load machine local configuration.
(let [src (util.expand "~/.nvim.fnl")
      dest (util.expand "~/.nvim.lua")]
  (when (util.exists? src)
    (compile.file src dest)
    (util.lua-file dest)))

{:aniseed/module :config.module.local-config}
