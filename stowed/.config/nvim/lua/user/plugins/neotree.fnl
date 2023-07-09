(local uu (require :user.util))

(uu.tx
  :nvim-neo-tree/neo-tree.nvim
  {:opts {:filesystem {:filtered_items {:hide_by_pattern ["/home/*/.config/nvim/lua/user/**.lua"]}

                       ;; Don't change the CWD if I open netrw style windows.
                       :cwd_target {:current :none}}}})
