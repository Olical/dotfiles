(module dotfiles.module.plugin.floaterm
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(set nvim.g.floaterm_position "center")

(util.nnoremap :lg ":FloatermNew lazygit; exit")
(nvim.ex.autocmd :FileType :floaterm ":lua require('dotfiles.module.plugin.floaterm').setup()")

(defn setup []
  (nvim.buf_set_keymap 0 :t :j :j
                       {:noremap true
                        :nowait true}))
