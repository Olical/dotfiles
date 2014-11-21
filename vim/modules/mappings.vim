" Set the local leader.
let maplocalleader = "|"

" Clears the search.
function! s:clear_search_results()
  let @/ = ""
endfunction

nnoremap <silent> <leader>/d :call <SID>clear_search_results()<CR>

" Shows the amount of matches for the previous search.
function! s:count_search_results()
  %s///gn
endfunction

nnoremap <leader>/c :call <SID>count_search_results()<CR>

" Deletes the hidden buffers.
function s:delete_hidden_buffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

nnoremap <silent> <leader>bd :call <SID>delete_hidden_buffers()<CR>

" Corrects the spelling under the cursor with the first suggestion.
function! s:correct_to_first_spelling_suggestion()
  1z=
endfunction

nnoremap <leader>z :call <SID>correct_to_first_spelling_suggestion()<CR>

" Trim the trailing white space from the file.
function! s:trim_trailing_whitespace()
  %s/\s\+$//e
endfunction

nnoremap <leader>cw :call <SID>trim_trailing_whitespace()<CR>

" Opens the split in a new tab. Kind like "distraction free" mode.
nnoremap <leader>wf :tab sp<CR>

" Pull from either side of a git conflict.
nnoremap <leader>gl :diffget LOCAL<CR>
nnoremap <leader>gr :diffget REMOTE<CR>

" Quick session bindings.
nnoremap <leader>sw :mksession! .quicksave.vim<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>

" Print out the current mappings.
function! s:show_mappings()
  let path = Dot('mappings.sh')
  exec '!' . path
endfunction

nnoremap <leader><leader> :call <SID>show_mappings()<CR>
