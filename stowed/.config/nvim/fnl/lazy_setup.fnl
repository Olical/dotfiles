(local lazy (require :lazy))
(local uu (require :dotfiles.util))

(lazy.setup
  [(uu.tx
     :AstroNvim/AstroNvim
     {:import :astronvim.plugins
      :opts {:icons_enabled true
             :mapleader " "
             :maplocalleader ","
             :pin_plugins nil}
      :version :^4})
   {:import :community}
   {:import :plugins}]
  {:defaults {:lazy false}
   :dev {:path "~/repos/Olical"}
   :install {:colorscheme [:astrodark :habamax]}
   :performance {:rtp {:disabled_plugins
                       [:gzip
                        :netrwPlugin
                        :tarPlugin
                        :tohtml
                        :zipPlugin]}}
   :ui {:backdrop 100}})
