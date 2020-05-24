(module dotfiles.module.plugin.which-key
  {require {nvim aniseed.nvim}})


(nvim.fn.which_key#register nvim.g.mapleader "g:which_key_map")
(nvim.fn.which_key#register nvim.g.maplocalleader "g:which_key_maplocal")

(nvim.ex.nnoremap "<silent> <leader> :<c-u>WhichKey '<Space>'<CR>")
(nvim.ex.vnoremap "<silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>")
(nvim.ex.nnoremap "<silent> <localleader> :<c-u>WhichKey ','<CR>")
(nvim.ex.vnoremap "<silent> <localleader> :<c-u>WhichKeyVisual ','<CR>")

(set nvim.g.which_key_maplocal
     {:name "+local"})

(set
  nvim.g.which_key_map
  {:* "grep-word"

   :w {:name "+windows"
       :m "maximise"
       :o "close-others"}

   :b {:name "+buffers"
       :d "delete"
       :o "delete-hidden"
       :t "trim-trailing-whitespace"}

   :t {:name "+tabs"
       :o "close-others"}

   :s {:name "+sessions"
       :w "write"
       :r "read"}

   :z {:name "+spellings"
       :z "select-first-correction"}})
