(module dotfiles.plugin.compe
  {autoload {compe compe
             nvim aniseed.nvim}})

(set nvim.o.completeopt "menuone,noselect")

(compe.setup
  {:enabled true
   :autocomplete true
   :debug false
   :min_length 1
   :preselect "enable"
   :throttle_time 80
   :source_timeout 200
   :incomplete_delay 400
   :max_abbr_width 100
   :max_kind_width 100
   :max_menu_width 100
   :documentation true
   :source {:path true
            :buffer true
            :calc true
            :nvim_lsp true
            :nvim_lua true
            :conjure true
            :vsnip true}})

(nvim.ex.inoremap "<silent><expr> <C-Space> compe#complete()")
(nvim.ex.inoremap "<silent><expr> <CR> compe#confirm('<CR>')")
(nvim.ex.inoremap "<silent><expr> <C-e> compe#close('<C-e>')")
(nvim.ex.inoremap "<silent><expr> <C-f> compe#scroll({ 'delta': +4 })")
(nvim.ex.inoremap "<silent><expr> <C-d> compe#scroll({ 'delta': -4 })")
