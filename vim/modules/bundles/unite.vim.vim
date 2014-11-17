" From: http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
let g:unite_source_history_yank_enable = 1

nnoremap <leader>uf :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>ul :<C-u>Unite -buffer-name=files -start-insert file<cr>
nnoremap <leader>ur :<C-u>Unite -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>uo :<C-u>Unite -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>ug :<C-u>Unite -buffer-name=grep -start-insert grep:.<cr>
nnoremap <leader>uy :<C-u>Unite -buffer-name=yank history/yank<cr>
nnoremap <leader>ub :<C-u>Unite -buffer-name=buffer buffer<cr>

function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

augroup unite_settings
  autocmd!
  autocmd FileType unite call s:unite_settings()
augroup END

" From: http://stackoverflow.com/a/17387785/455137
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
