-- [nfnl] lsp/typedclojure.fnl
return {cmd = vim.lsp.rpc.connect("localhost", 9999), filetypes = {"clojure"}, root_markers = {"deps.edn"}, settings = {clojure = {}}}
