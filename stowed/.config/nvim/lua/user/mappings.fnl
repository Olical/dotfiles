(local uu (require :user.util))

{:n {"<leader>bt" (uu.tx ":%s/\\s\\+$//e<cr>" {:desc "Delete trailing whitespace"})
     "<leader>bn" (uu.tx ":tabnew<cr>" {:desc "Create a new tab"})}
 :t {"<S-Esc>" (uu.tx "<c-\\><c-n>" {:desc "Enter Normal mode"})}}
