(import-macros {: tx} :config.macros)

(local lsps
  ["clojure_lsp"
   "fennel_language_server"
   "lua_ls"
   "jsonls"
   "yamlls"
   "marksman"
   "html"
   "basedpyright"
   "ts_ls"
   "terraformls"
   "tailwindcss"
   "dockerls"
   "docker_compose_language_service"
   "bashls"
   "taplo"
   "sqlls"])

[(tx "williamboman/mason.nvim"
   {:event "VeryLazy"
    :opts {}})

 (tx "williamboman/mason-lspconfig.nvim"
   {:event "VeryLazy"
    :dependencies ["williamboman/mason.nvim"]
    :opts {:ensure_installed lsps
           :automatic_installation true}})

 (tx "neovim/nvim-lspconfig"
   {:lazy false
    :dependencies ["williamboman/mason-lspconfig.nvim" "hrsh7th/cmp-nvim-lsp"]
    :keys [(tx "<leader>ld" "<CMD>Telescope lsp_definitions<CR>" {:desc "LSP definition"})
           (tx "<leader>lu" "<CMD>Telescope lsp_implementations<CR>" {:desc "LSP implementations"})
           (tx "<leader>lt" "<CMD>Telescope lsp_type_definitions<CR>" {:desc "LSP type definitions"})
           (tx "<leader>lr" "<CMD>Telescope lsp_references<CR>" {:desc "LSP references"})
           (tx "<leader>li" "<CMD>Telescope lsp_incoming_calls<CR>" {:desc "LSP incoming calls"})
           (tx "<leader>lo" "<CMD>Telescope lsp_outgoing_calls<CR>" {:desc "LSP outgoing calls"})
           (tx "<leader>ls" "<CMD>Telescope lsp_document_symbols<CR>" {:desc "LSP document symbols"})
           (tx "<leader>lS" "<CMD>Telescope lsp_workspace_symbols<CR>" {:desc "LSP workspace symbols"})
           (tx "<leader>lx" "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>" {:desc "LSP dynamic workspace symbols (all workspaces)"})
           (tx "<leader>laf" vim.lsp.buf.format {:desc "LSP format"})
           (tx "<leader>lar" vim.lsp.buf.rename {:desc "LSP rename"})]
    :config
    (fn []
      (let [lspconfig (require :lspconfig)
            caps ((. (require :cmp_nvim_lsp) :default_capabilities))
            mlsp (require :mason-lspconfig)]
        (mlsp.setup_handlers
          (tx (fn [server-name]
                ((. (require :lspconfig) server-name :setup)
                 {:capabilities caps}))

              {:fennel_language_server
               (fn []
                 ((. lspconfig :fennel_language_server :setup)
                  {:capabilities caps
                   :root_dir (lspconfig.util.root_pattern "fnl")
                   :single_file_support true
                   :settings {:fennel {:workspace {:library (vim.api.nvim_list_runtime_paths)}
                   :diagnostics {:globals [:vim]}}}}))}))))})

 (tx "RubixDev/mason-update-all"
   {:cmd "MasonUpdateAll"
    :dependencies ["williamboman/mason.nvim"]
    :main "mason-update-all"
    :opts {}})]
