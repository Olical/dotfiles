(module dotfiles.module.plugin.fzf
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(defn- map [from to]
  (util.nnoremap
    from
    (.. ":" to)))

(map :fg "Rg")
(map :ff "Files")
(map :fb "Buffers")
(map :fw "Windows")
(map :fh "History")
(map :fc "Commands")
(map :fm "Maps")
(map :ft "Filetypes")
(map :fM "Marks")
(map :fH "Helptags")
