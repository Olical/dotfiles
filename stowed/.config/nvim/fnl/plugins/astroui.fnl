(local uu (require :dotfiles.util))

(uu.tx
  :AstroNvim/astroui
  {:opts {:colorscheme :astrodark
          :highlights {:astrotheme {}
                       :init {}}
          :icons {:LSPLoading1 "⠋"
                  :LSPLoading10 "⠏"
                  :LSPLoading2 "⠙"
                  :LSPLoading3 "⠹"
                  :LSPLoading4 "⠸"
                  :LSPLoading5 "⠼"
                  :LSPLoading6 "⠴"
                  :LSPLoading7 "⠦"
                  :LSPLoading8 "⠧"
                  :LSPLoading9 "⠇"}}})
