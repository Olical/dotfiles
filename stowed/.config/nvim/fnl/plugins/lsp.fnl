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

(local formatters
  {:lua ["stylua"]
   :sh ["shfmt"]
   :python ["isort" "black"]
   :rust ["rustfmt"]
   :clojure ["cljfmt"]
   :javascript ["prettierd"]
   :html ["prettierd"]
   :css ["prettierd"]
   :yaml ["prettierd"]
   :markdown ["prettierd"]
   :fennel ["fnlfmt"]})

(local disable_formatter_on_save
  ;; These mess with the buffer, so we keep them available for manual invocation but never automatic.
  {:fennel true})

(local disable_formatter_auto_install
  ;; These need to be installed outside of Mason.
  {:fnlfmt true
   :rustfmt true})

[(tx "williamboman/mason.nvim"
   {:opts {}})

 (tx "stevearc/conform.nvim"
   {:dependencies ["rcarriga/nvim-notify"]
    :opts {:formatters_by_ft formatters
           :format_on_save
           (fn [_buf]
             (when (and vim.g.dotfiles_format_on_save (or (= nil vim.b.dotfiles_format_on_save) vim.b.dotfiles_format_on_save)
                        (not (. disable_formatter_on_save vim.bo.filetype)))
               {:timeout_ms 500
                :lsp_format "fallback"}))}

    :config (fn [_ opts]
              (let [conform (require :conform)
                    registry (require :mason-registry)
                    formatters-for-mason {}]

                (vim.schedule
                  (fn []
                    (each [_ft formatters (pairs formatters)]
                      (each [_idx formatter (ipairs formatters)]
                        (when (not (. disable_formatter_auto_install formatter))
                          (tset formatters-for-mason formatter true))))

                    (each [formatter _true (pairs formatters-for-mason)]
                      (let [pkg (registry.get_package formatter)]
                        (when (not (pkg:is_installed))
                          (vim.notify (.. "Automatically installing " formatter " with Mason."))
                          (pkg:install))))))

                (set vim.g.dotfiles_format_on_save true)
                (conform.setup opts)
                (set vim.o.formatexpr "v:lua.require'conform'.formatexpr()")))

    :keys [(tx "<leader>tf" (fn []
                              (set vim.b.dotfiles_format_on_save
                                   (if (= nil vim.b.dotfiles_format_on_save)
                                     false
                                     (not vim.b.dotfiles_format_on_save)))
                              (vim.notify (.. "Set vim.b.dotfiles_format_on_save to " (tostring vim.b.dotfiles_format_on_save))))
               {:desc "Toggle buffer formatting"})
           (tx "<leader>tF" (fn []
                              (set vim.g.dotfiles_format_on_save (not vim.g.dotfiles_format_on_save))
                              (vim.notify (.. "Set vim.g.dotfiles_format_on_save to " (tostring vim.g.dotfiles_format_on_save))))
               {:desc "Toggle global formatting"})]})

 (tx "williamboman/mason-lspconfig.nvim"
   {:dependencies ["williamboman/mason.nvim"]
    :opts {:ensure_installed lsps
           :automatic_installation true}})

 (tx "neovim/nvim-lspconfig"
   {:lazy false
    :dependencies ["williamboman/mason-lspconfig.nvim" "hrsh7th/cmp-nvim-lsp" "stevearc/conform.nvim"]
    :keys [(tx "<leader>ld" "<CMD>Telescope lsp_definitions<CR>" {:desc "LSP definition"})
           (tx "<leader>lu" "<CMD>Telescope lsp_implementations<CR>" {:desc "LSP implementations"})
           (tx "<leader>lt" "<CMD>Telescope lsp_type_definitions<CR>" {:desc "LSP type definitions"})
           (tx "<leader>lr" "<CMD>Telescope lsp_references<CR>" {:desc "LSP references"})
           (tx "<leader>li" "<CMD>Telescope lsp_incoming_calls<CR>" {:desc "LSP incoming calls"})
           (tx "<leader>lo" "<CMD>Telescope lsp_outgoing_calls<CR>" {:desc "LSP outgoing calls"})
           (tx "<leader>ls" "<CMD>Telescope lsp_document_symbols<CR>" {:desc "LSP document symbols"})
           (tx "<leader>lS" "<CMD>Telescope lsp_workspace_symbols<CR>" {:desc "LSP workspace symbols"})
           (tx "<leader>lx" "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>" {:desc "LSP dynamic workspace symbols (all workspaces)"})
           (tx "<leader>laf" (fn [] ((. (require :conform) :format))) {:desc "LSP format"})
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
