nnoremap <silent> <leader>uf :Unite -start-insert file_rec/async<CR>
nnoremap <silent> <leader>ub :Unite -start-insert buffer<CR>
nnoremap <silent> <leader>uc :Unite -start-insert command<CR>
nnoremap <silent> <leader>um :Unite -start-insert mapping<CR>
nnoremap <silent> <leader>unf :Unite -start-insert file/new<CR>
nnoremap <silent> <leader>und :Unite -start-insert directory/new<CR>
nnoremap <silent> <leader>ug :Unite grep:.<CR>

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
