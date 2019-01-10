let g:LanguageClient_serverCommands = {
  \ 'rust': ['rustup', 'run', 'stable', 'rls'],
  \ }

autocmd FileType rust nnoremap <buffer> <localleader>rm :call LanguageClient_contextMenu()<cr>
autocmd FileType rust nnoremap <buffer> K :call LanguageClient#textDocument_hover()<cr>
autocmd FileType rust nnoremap <buffer> gd :call LanguageClient#textDocument_definition()<cr>
