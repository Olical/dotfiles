(module dotfiles.plugin.fzf
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(nvim.ex.command_
  "-bang -nargs=* Rg"
  "call fzf#vim#grep(\""
  "rg --column --line-number --no-heading --color=always --smart-case --hidden --follow -g '!.git/'"
  "-- \".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)")

(util.lnnoremap :fg "Rg")
(util.lnnoremap :* "Rg <c-r><c-w>")
(util.lnnoremap :ff "Files")
(util.lnnoremap :fb "Buffers")
(util.lnnoremap :fw "Windows")
(util.lnnoremap :fh "History")
(util.lnnoremap :fc "Commands")
(util.lnnoremap :fm "Maps")
(util.lnnoremap :ft "Filetypes")
(util.lnnoremap :fM "Marks")
(util.lnnoremap :fH "Helptags")
