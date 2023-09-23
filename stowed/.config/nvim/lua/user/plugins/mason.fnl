(local uu (require :user.util))
(local utils (uu.autoload :astronvim.utils))
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
              (set dap.adapters.clojure
                   (fn [cb config]
                     (if
                       (= :attach config.request)
                       (error "Attaching to Clojure is not yet supported")

                       (= :launch config.request)
                       (cb
                         {:type :executable
                          :command "/home/olical/repos/Olical/clojure-dap/script/run"
                          :args []
                          :options {:source_filetype :clojure}})

                       (error (.. "Unknown request" (or config.request "nil"))))))

              (set dap.configurations.clojure
                   [{:type :clojure
                     :request :launch
                     :name "Launch file"

                     :program "${file}"}]))

            opts)})]
