let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

autocmd FileType rust nnoremap <buffer> K :call LanguageClient#textDocument_hover()<cr>
autocmd FileType rust nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<cr>
autocmd FileType rust nnoremap <buffer> <localleader>,rr :call LanguageClient#textDocument_rename()<cr>
autocmd FileType rust nnoremap <buffer> <localleader>,rs :call LanugageClient_textDocument_documentSymbol()<cr>
