let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fc :Commands<cr>
nnoremap <leader>fh :Helptags<cr>
nnoremap <leader>fm :Maps<cr>
nnoremap <leader>f: :History:<cr>
nnoremap <leader>ft :Filetypes<cr>
nnoremap <leader>fr :History<cr>
nnoremap <leader>* :Rg <c-r><c-w><cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden -g "!.git/" --column --line-number --no-heading --color=never '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
