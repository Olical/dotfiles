{:colorscheme :astrodark
 :diagnostics {:underline true
               :virtual_text true}
 :lazy {:defaults {:lazy false}}
 :lsp {:formatting {:disabled {}
                    :format_on_save {:enabled true
                                     :ignore_filetypes {}}
                    :timeout_ms 1000}
       :servers {}}
 :polish (fn [])
 :updater {:auto_quit false
           :branch :nightly
           :channel :stable
           :commit nil
           :pin_plugins nil
           :remote :origin
           :remotes {}
           :show_changelog true
           :skip_prompts false
           :version :latest}}
