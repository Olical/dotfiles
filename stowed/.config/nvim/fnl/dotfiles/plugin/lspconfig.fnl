(module dotfiles.plugin.lspconfig
  {autoload {util dotfiles.util
             nvim aniseed.nvim}})

(let [lsp (require :lspconfig)]
  (when lsp
    (lsp.clojure_lsp.setup {})))

(defn- map [from to]
  (util.nnoremap from to {:local? true}))

(defn setup []
  ;; https://www.chrisatmachine.com/Neovim/27-native-lsp/
  (map :gd "lua vim.lsp.buf.definition()")
  (map :gD "lua vim.lsp.buf.declaration()")
  (map :gr "lua vim.lsp.buf.references()")
  (map :gi "lua vim.lsp.buf.implementation()")
  (map :K "lua vim.lsp.buf.hover()")
  (map :<c-k> "lua vim.lsp.buf.signature_help()")
  (map :<c-n> "lua vim.lsp.diagnostic.goto_prev()")
  (map :<c-p> "lua vim.lsp.diagnostic.goto_next()")

  (map :<leader>lr "lua vim.lsp.buf.rename()")
  (map :<leader>lf "lua vim.lsp.buf.formatting()"))

(nvim.ex.augroup :lspconfig-config)
(nvim.ex.autocmd_)
(nvim.ex.autocmd :FileType :clojure "lua require('dotfiles.plugin.lspconfig').setup()")
(nvim.ex.augroup :END)
