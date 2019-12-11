(local nvim (require :aniseed.nvim))
(local mapping (require :aniseed.mapping))

(mapping.init)

(fn ft-map [ft mode from to]
  "Map some keys (prefixed by <localleader>) to a command for a filetype."
  (nvim.ex.autocmd
    :FileType ft
    (.. mode :map) :<buffer>
    (.. :<localleader> from)
    to))

(fn plug [cmd]
  "Wraps the given command in <Plug>(...)"
  (.. "<Plug>(" cmd ")"))

(nvim.ex.augroup :aniseed)
(nvim.ex.autocmd_)
(ft-map :fennel :n :E (plug :AniseedEval))
(ft-map :fennel :n :ee (.. (plug :AniseedEval) :af))
(ft-map :fennel :n :er (.. (plug :AniseedEval) :aF))
(ft-map :fennel :n :ef (plug :AniseedEvalCurrentFile))
(ft-map :fennel :v :ee (plug :AniseedEvalSelection))
(ft-map :fennel :n :eb ":%AniseedEvalRange<cr>")
(ft-map :fennel :n :ta ":AniseedRunAllTests<cr>")
(nvim.ex.augroup :END)
