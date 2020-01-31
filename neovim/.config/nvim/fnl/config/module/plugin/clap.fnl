(local nvim (require :aniseed.nvim))

(set nvim.g.clap_provider_grep_delay 50)
(set nvim.g.clap_provider_grep_opts "-H --no-heading --vimgrep --smart-case --hidden")
(set nvim.g.clap_layout {:relative :editor})

(fn nnoremap [from to]
  (nvim.set_keymap :n (.. "<leader>" from) (.. ":Clap " to "<cr>") {:noremap true}))

(nnoremap :* "grep ++query=<cword>")
(nnoremap :fg "grep")
(nnoremap :ff "files --hidden")
(nnoremap :fd "filer")
(nnoremap :fb "buffers")
(nnoremap :fw "windows")
(nnoremap :fh "history")
(nnoremap :f: "command_history")
(nnoremap :fj "jumps")
(nnoremap :fl "blines")
(nnoremap :fL "lines")
(nnoremap :ft "filetypes")
(nnoremap :fm "marks")
(nnoremap :fy "yanks")
(nnoremap "f\"" "registers")
