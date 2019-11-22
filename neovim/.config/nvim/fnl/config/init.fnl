(local nvim (require :aniseed.nvim))
(local compile (require :aniseed.compile))
(local util (require :config.util))

;; Compile and load machine local configuration.
;; TODO Do I need exapand?
(let [src (util.expand "~/.nvim.fnl")
      dest (util.expand "~/.nvim.lua")]
  (print src dest)
  (when (nvim.fn.filereadable src)
    (compile.file src dest)
    (nvim.ex.luafile dest)))
