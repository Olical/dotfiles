(local uu (require :dotfiles.util))

(uu.tx
  :AstroNvim/astrolsp
  {:opts
   {:autocmds {:lsp_document_highlight {1 {:callback (fn []
                                                       (vim.lsp.buf.document_highlight))
                                           :desc "Document Highlighting"
                                           :event [:CursorHold
                                                   :CursorHoldI]}
                                        2 {:callback (fn []
                                                       (vim.lsp.buf.clear_references))
                                           :desc "Document Highlighting Clear"
                                           :event [:CursorMoved
                                                   :CursorMovedI
                                                   :BufLeave]}
                                        :cond :textDocument/documentHighlight}}
    :config {}
    :features {:autoformat true
               :codelens true
               :inlay_hints false
               :semantic_tokens true}
    :formatting {:disabled {}
                 :format_on_save {:allow_filetypes {}
                                  :enabled true
                                  :ignore_filetypes {}}
                 :timeout_ms 1000}
    :handlers {}
    :mappings {:n {:gl (uu.tx
                         (fn [] (vim.diagnostic.open_float))
                         {:desc "Hover diagnostics"})}}
    :on_attach (fn [_client _bufnr]
                 nil)
    :servers {}}})
