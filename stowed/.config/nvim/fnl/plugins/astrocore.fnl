(local uu (require :dotfiles.util))

(uu.tx
  :AstroNvim/astrocore
  {:opts
   {:diagnostics {:underline true :virtual_text true}
    :features {:autopairs true
               :cmp true
               :diagnostics_mode 3
               :highlighturl true
               :large_buf {:lines 10000 :size (* 1024 500)}
               :notifications true}
    :mappings {:n {"<leader>bt" (uu.tx ":%s/\\s\\+$//e<cr>" {:desc "Delete trailing whitespace"})
                   "<leader>bn" (uu.tx ":tabnew<cr>" {:desc "Create a new tab"})}
               :t {"<S-Esc>" (uu.tx "<c-\\><c-n>" {:desc "Enter Normal mode"})}}
    :options {:g {:mapleader " "
                  :maplocalleader ","
                  :autoformat_enabled true
                  :cmp_enabled true
                  :autopairs_enabled true
                  :diagnostics_mode 3 ;; Visibility of diagnostics (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
                  :icons_enabled true
                  :ui_notifications_enabled true
                  :resession_enabled true

                  ;; https://neovide.dev/configuration.html
                  :neovide_hide_mouse_when_typing true
                  :neovide_cursor_animation_length 0.05
                  :neovide_cursor_trail_size 0.5}
              :opt {:signcolumn :auto
                    :exrc true
                    :number false
                    :relativenumber false
                    :spell true
                    :wrap true
                    :sessionoptions "blank,curdir,folds,help,tabpages,winsize"
                    :clipboard "unnamedplus"
                    :list true
                    :listchars "tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"
                    :shortmess "atOIc"
                    :cmdheight 1
                    :foldcolumn "0"
                    :showtabline 1
                    :guifont "FiraCode Nerd Font:h10"}}}})
