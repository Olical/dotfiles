(local uu (require :user.util))
(local utils (uu.autoload :astronvim.utils))
(local lspconfig (uu.autoload :lspconfig))
(local lspcfgs (uu.autoload :lspconfig.configs))

;; TODO :opts should maybe be :config

[(uu.tx
   :williamboman/mason-lspconfig.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed [:fennel_language_server]))
            (set opts.handlers.lua_ls
                 (fn []
                   (lspconfig.lua_ls.setup
                     {:settings {:Lua {:diagnostics {:globals [:vim]}}}})))

            (set opts.handlers.fennel_language_server
                 (fn []
                   (set lspcfgs.fennel_language_server
                        {:default_config {:filetypes [:fennel]
                                          :root_dir (lspconfig.util.root_pattern :fnl)
                                          :single_file_support true
                                          :settings {:fennel {:diagnostics {:globals [:vim]}
                                                              :workspace {:library (vim.api.nvim_list_runtime_paths)}}}}}))))})

 (uu.tx
   :jay-babu/mason-null-ls.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed [])))})

 (uu.tx
   :jay-babu/mason-nvim-dap.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed [])))})]
