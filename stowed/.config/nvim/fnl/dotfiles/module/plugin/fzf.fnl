(module dotfiles.module.plugin.fzf
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(nvim.ex.command_
  "-bang -nargs=* Rg"
  "call fzf#vim#grep(\""
  "rg --column --line-number --no-heading --color=always --smart-case --hidden --follow -g '!.git/'"
  "-- \".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)")

(defn- map [from to]
  (util.nnoremap
    from
    (.. ":" to)))

(map :fg "Rg")
(map :* "Rg <c-r><c-w>")
(map :ff "Files")
(map :fb "Buffers")
(map :fw "Windows")
(map :fh "History")
(map :fc "Commands")
(map :fm "Maps")
(map :ft "Filetypes")
(map :fM "Marks")
(map :fH "Helptags")
