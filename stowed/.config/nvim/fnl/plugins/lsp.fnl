(import-macros {: tx} :config.macros)

(local lsps
  ["clojure_lsp"
   ; "fennel_ls"
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

(local filetype->formatters
  {:lua ["stylua"]
   :sh ["shfmt"]
   :python ["ruff_organize_imports" "ruff_format"]
   :rust ["rustfmt"]
   :toml ["taplo"]
   :clojure ["cljfmt"]
   :json ["prettierd"]
   :javascript ["prettierd"]
   :typescript ["prettierd"]
   :jsx ["prettierd"]
   :html ["prettierd"]
   :css ["prettierd"]
   :yaml ["prettierd"]
   :markdown ["prettierd"]
   :fennel ["fnlfmt"]
   :sql ["sqlfmt"]
   :gleam ["gleam"]
   :* ["trim_whitespace" "trim_newlines"]})

(local formatter->package
  {"ruff_organize_imports" "ruff"
   "ruff_format" "ruff"})

(local disable-formatter-on-save
  ;; These mess with the buffer, so we keep them available for manual invocation but never automatic.
  {:fennel true
   :sql true})

(local disable-formatter-auto-install
  ;; These need to be installed outside of Mason.
  {:fnlfmt true
   :rustfmt true
   :trim_whitespace true
   :trim_newlines true
   :gleam true})

(vim.lsp.enable ["fennel-ls" "typedclojure"])

[(tx "williamboman/mason.nvim"
   {:tag "v1.11.0"
    :opts {}})

 (tx "stevearc/conform.nvim"
   {:dependencies ["rcarriga/nvim-notify"]
    :opts {:formatters_by_ft filetype->formatters
           :format_on_save
           (fn [_buf]
             (when (and vim.g.dotfiles_format_on_save (or (= nil vim.b.dotfiles_format_on_save) vim.b.dotfiles_format_on_save)
                        (not (. disable-formatter-on-save vim.bo.filetype)))
               {:timeout_ms 500
                :lsp_format "fallback"}))}

    :config (fn [_ opts]
              (let [conform (require :conform)
                    registry (require :mason-registry)
                    formatters-for-mason {}]

                (set conform.formatters.shfmt {:prepend_args ["-i" "2" "-ci"]})

                (vim.schedule
                  (fn []
                    (each [_ft formatters (pairs filetype->formatters)]
                      (each [_idx formatter (ipairs formatters)]
                        (when (not (. disable-formatter-auto-install formatter))
                          (tset formatters-for-mason (or (. formatter->package formatter) formatter) true))))

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
   {:tag "v1.32.0"
    :dependencies ["williamboman/mason.nvim"]
    :opts {:ensure_installed lsps
           :automatic_installation true}})

 (tx "neovim/nvim-lspconfig"
   {:lazy false
    :dependencies ["williamboman/mason-lspconfig.nvim" "hrsh7th/cmp-nvim-lsp" "stevearc/conform.nvim"]
    :keys [(tx "<leader>lA" #(vim.lsp.buf.code_action) {:desc "Invoke code_action, prompting for an action to take at the cursor"})
           (tx "<leader>laf" (fn [] ((. (require :conform) :format))) {:desc "LSP format"})
           (tx "<leader>lar" vim.lsp.buf.rename {:desc "LSP rename"})]
    :config
    (fn []
      (let [caps ((. (require :cmp_nvim_lsp) :default_capabilities))
            mlsp (require :mason-lspconfig)]
        (vim.lsp.enable "gleam")
        (mlsp.setup_handlers
          (tx (fn [server-name]
                (vim.lsp.config server-name {:capabilities caps})
                (vim.lsp.enable server-name))
              {:tailwindcss
               (fn []
                 ;; https://github.com/tailwindlabs/tailwindcss/discussions/7554#discussioncomment-12991596
                 ;; https://github.com/tailwindlabs/tailwindcss-intellisense/issues/400#issuecomment-2336568169
                 ;; https://github.com/tailwindlabs/tailwindcss-intellisense/issues/400#issuecomment-2664427180
                 (vim.lsp.config "tailwindcss"
                   {:settings
                    {:tailwindCSS
                     {:experimental
                      {:classRegex [["\\[:[^.\\s]*((?:\\.[^.\\s\\]]*)+)[\\s\\]]" "\\.([^.]*)"]
                                    ["\\:(\\.[^\\s#]+(?:\\.[^\\s#]+)*)" "\\.([^\\.\\s#]+)"]
                                    ["class\\s+(\\:[^\\s\\}]*)[\\s\\}]" "[\\:.]([^.]*)"]
                                    ["class\\s+(\"[^\\}\"]*)\"" "[\"\\s]([^\\s\"]*)"]
                                    ["class\\s+\\[([\\s\\S]*)\\]" "[\"\\:]([^\\s\"]*)[\"]?"]
                                    ["class\\s+'\\[([\\s\\S]*)\\]" "([^\\s]*)?"]]}
                      :includeLanguages {:clojure "html"
                                         :clojurescript "html"}}}})
                 (vim.lsp.enable "tailwindcss"))}))))})

 (tx "RubixDev/mason-update-all"
   {:cmd "MasonUpdateAll"
    :dependencies ["williamboman/mason.nvim"]
    :main "mason-update-all"
    :opts {}})]
