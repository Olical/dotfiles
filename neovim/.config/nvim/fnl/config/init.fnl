(local nvim (require :aniseed.nvim))
(local compile (require :aniseed.compile))

;; Compile and load machine local configuration.
(let [src (nvim.fn.expand "~/.nvim.fnl")
      dest (nvim.fn.expand "~/.nvim.lua")]
  (when (nvim.fn.filereadable src)
    (compile.file src dest)
    (nvim.ex.luafile dest)))
