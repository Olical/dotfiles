(local uu (require :user.util))

{:n {"<leader>bt" (uu.tx ":%s/\\s\\+$//e<cr>" {:desc "Delete trailing whitespace"})
     "<leader>bn" (uu.tx ":tabnew<cr>" {:desc "Create a new tab"})
     "J" (uu.tx "A<space><esc>J" {:desc "Join lines (parinfer workaround https://github.com/gpanders/nvim-parinfer/issues/12)"})}
 :t {"<S-Esc>" (uu.tx "<c-\\><c-n>" {:desc "Enter Normal mode"})}}
