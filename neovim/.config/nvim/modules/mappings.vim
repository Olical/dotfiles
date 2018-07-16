nnoremap <space> <nop>
let mapleader = "\<space>"
let maplocalleader = ","

inoremap jk <Esc>
cnoremap jk <C-c>

nnoremap <leader>wm :tab sp<CR>
nnoremap <leader>bD :bdelete!<CR>
nnoremap <leader>wo :only<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>bo :call <SID>delete_hidden_buffers()<CR>
nnoremap <leader>zz :call <SID>correct_to_first_spelling_suggestion()<CR>
nnoremap <leader>tw :call <SID>trim_trailing_whitespace()<CR>
tnoremap jk <c-\><c-n>
nnoremap <leader>sw :mksession! .quicksave.vim<CR>:echo "Session saved."<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>:echo "Session loaded."<CR>

function! s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

function! s:correct_to_first_spelling_suggestion()
  normal! 1z=
endfunction

function! s:trim_trailing_whitespace()
  %s/\s\+$//e
endfunction
