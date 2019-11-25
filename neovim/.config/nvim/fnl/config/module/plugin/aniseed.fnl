(local nvim (require :aniseed.nvim))
(local mapping (require :aniseed.mapping))

(mapping.init)

(fn map! [mode from to suffix]
  "Map some keys (prefixed by <localleader>) to a command."
  (nvim.ex.autocmd
    :FileType :fennel
    (.. mode :map) :<buffer>
    (.. :<localleader> from)
    (.. to (or suffix ""))))

(fn plug-map! [mode from to suffix]
  "Adds a map in terms of map! but wraps the target command in <Plug>(...)."
  (map! mode from (.. "<Plug>(" to ")") suffix))

(nvim.ex.augroup :aniseed)
(nvim.ex.autocmd_)

(plug-map! :n :E :AniseedEval)
(plug-map! :n :ee :AniseedEval :af)
(plug-map! :n :er :AniseedEval :aF)
(plug-map! :n :ef :AniseedEvalCurrentFile)
(map! :n :eb ":%AniseedEvalRange<cr>")
(plug-map! :v :ee :AniseedEvalSelection)

(nvim.ex.augroup :END)
