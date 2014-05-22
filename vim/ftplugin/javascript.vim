" Rename a JavaScript variable using tern.
nnoremap <buffer> <localleader>r :TernRename<CR>

" Enable JSXHint when in react.
augroup JSXHintSwap
  autocmd!
  autocmd BufEnter *.react.js let g:syntastic_javascript_checkers = ['jsxhint']
  autocmd BufLeave *.react.js let g:syntastic_javascript_checkers = ['jshint']
augroup END
