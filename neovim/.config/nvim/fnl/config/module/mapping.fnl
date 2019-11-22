(local nvim (require :aniseed.nvim))
(local nu (require :aniseed.nvim.util))
(local core (require :aniseed.core))

(fn noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

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

;; Aniseed evaluation mappings.
(nvim.ex.augroup :aniseed)
(nvim.ex.autocmd_)
(ft-map :fennel :n :E (plug :AniseedEval))
(ft-map :fennel :n :ee (.. (plug :AniseedEval) :af))
(ft-map :fennel :n :er (.. (plug :AniseedEval) :aF))
(ft-map :fennel :n :ef (plug :AniseedEvalCurrentFile))
(ft-map :fennel :v :ee (plug :AniseedEvalSelection))
(ft-map :fennel :n :eb ":%AniseedEvalRange<cr>")
(nvim.ex.augroup :END)

;; Generic mapping configuration.
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; jk escape sequences.
(noremap :i :jk :<esc>)
(noremap :c :jk :<c-c>)
(noremap :t :jk :<c-\><c-n>)

;; Spacemacs style leader mappings.
(noremap :n :<leader>wm ":tab sp<cr>")
(noremap :n :<leader>bd ":bdelete!<cr>")
(noremap :n :<leader>wc ":only<cr>")
(noremap :n :<leader>to ":tabonly<cr>")
(noremap :n :<leader>sw ":mksession! .quicksave.vim<cr>")
(noremap :n :<leader>sr ":source .quicksave.vim<cr>")

;; Delete hidden buffers.
(noremap :n :<leader>bo ":call ConfigDeleteHiddenBuffers()<cr>")

;; Correct to first spelling suggestion.
(noremap :n :<leader>zz ":normal! 1z=<cr>")

;; Trim trialing whitespace.
(noremap :n :<leader>tw ":%s/\\s\\+$//e<cr>")

(nu.fn-bridge
  :ConfigDeleteHiddenBuffers
  :config.module.mapping :delete-hidden-buffers)

(fn delete-hidden-buffers []
  (let [visible-bufs (->> (nvim.fn.range 1 (nvim.fn.tabpagenr :$))
                          (core.map nvim.fn.tabpagebuflist)
                          (unpack)
                          (core.concat))]
    (->> (nvim.fn.range 1 (nvim.fn.bufnr :$))
         (core.filter
	   (fn [bufnr]
	     (and (nvim.fn.bufexists bufnr)
	          (= -1 (nvim.fn.index visible-bufs bufnr)))))
         (core.run!
	   (fn [bufnr]
	     (nvim.ex.bwipeout bufnr))))))

{:aniseed/module :config.module.mapping
 :delete-hidden-buffers delete-hidden-buffers}
