let g:ctrlp_map = '<leader>pf'
nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <leader>pr :CtrlPMRUFiles<cr>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore .git -g ""'
  let g:ctrlp_use_caching = 0
endif
