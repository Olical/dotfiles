(local uu (require :dotfiles.util))

(uu.tx
  :mbbill/undotree
  {:keys [(uu.tx "<leader>z" ":UndotreeShow<cr>:UndotreeFocus<cr>"
                 {:desc "Open Undotree"})]})
