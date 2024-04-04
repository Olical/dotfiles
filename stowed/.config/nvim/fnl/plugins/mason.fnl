(local uu (require :dotfiles.util))
(local utils (uu.autoload :astrocore))
(local lspconfig (uu.autoload :lspconfig))

[(uu.tx
   :williamboman/mason-lspconfig.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed [:fennel_language_server]))

            (set opts.handlers.lua_ls
                 (fn []
                   (lspconfig.lua_ls.setup
                     {:settings {:Lua {:diagnostics {:globals [:vim :jit]}}}})))

            (set opts.handlers.fennel_language_server
                 (fn []
                   (lspconfig.fennel_language_server.setup
                     {:filetypes [:fennel]
                      :root_dir (lspconfig.util.root_pattern :fnl :lua)
                      :single_file_support true
                      :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
                                          :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})))
            opts)})

 (uu.tx
   :jay-babu/mason-null-ls.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed []))
            opts)})

 (uu.tx
   :jay-babu/mason-nvim-dap.nvim
   {:opts (fn [_ opts]
            (set opts.ensure_installed (utils.list_insert_unique opts.ensure_installed []))

            (let [dap (require :dap)]
              (dap.set_log_level "TRACE")
              (set dap.adapters.clojure
                   (fn [cb config]
                     (if
                       (= :attach config.request)
                       (cb
                         {:type :executable
                          :command "/home/olical/repos/Olical/clojure-dap/script/run"
                          :args []
                          :options {:source_filetype :clojure
                                    :initialize_timeout_sec 20}})

                       (= :launch config.request)
                       (error "Launching the debuggee through clojure-dap is not supported, use attach instead.")

                       (error (.. "Unknown request" (or config.request "nil"))))))

              (set dap.configurations.clojure
                   [{:type :clojure
                     :request :attach
                     :name "Start Clojure DAP and attach to a running nREPL"}]))

            opts)})]
