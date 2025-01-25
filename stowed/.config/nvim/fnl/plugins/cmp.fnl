(import-macros {: tx} :config.macros)

(tx "hrsh7th/nvim-cmp"
  {:event "VeryLazy"
   :main "cmp"
   :dependencies ["hrsh7th/cmp-nvim-lsp"
                  "hrsh7th/cmp-buffer" 
                  "hrsh7th/cmp-path"
                  "hrsh7th/cmp-cmdline"]

   :config
   (fn [_ opts]
     (let [cmp (require :cmp)]
       (cmp.setup
         {:sources (cmp.config.sources
                     [{:name "nvim_lsp"}
                      {:name "buffer"}])
; window = {
;       -- completion = cmp.config.window.bordered(),
;       -- documentation = cmp.config.window.bordered(),
;     },
; mapping = cmp.mapping.preset.insert({
;       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
;       ['<C-f>'] = cmp.mapping.scroll_docs(4),
;       ['<C-Space>'] = cmp.mapping.complete(),
;       ['<C-e>'] = cmp.mapping.abort(),
;       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
;     }),
         })

       (cmp.setup.cmdline
         ["/" "?"]
         {:mapping (cmp.mapping.preset.cmdline)
          :sources [{:name "buffer"}]})

       (cmp.setup.cmdline
         ":"
         {:mapping (cmp.mapping.preset.cmdline)
          :sources (cmp.config.sources [{:name "path"} {:name "cmdline"}])
          :matching {:disallow_symbol_nonprefix_matching false}})))})

 ;  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
 ;  -- Set configuration for specific filetype.
 ;  --[[ cmp.setup.filetype('gitcommit', {
 ;    sources = cmp.config.sources({
 ;      { name = 'git' },
 ;    }, {
 ;      { name = 'buffer' },
 ;    })
 ; })
 ; require("cmp_git").setup() ]]-- 

  ; -- Set up lspconfig.
  ; local capabilities = require('cmp_nvim_lsp').default_capabilities()
  ; -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  ; require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  ;   capabilities = capabilities
  ; }
