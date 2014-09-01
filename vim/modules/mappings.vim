" Set the local leader.
let maplocalleader = "|"

" Clears the search.
nnoremap <silent> <leader>c/ :nohlsearch<CR>

" Deletes the hidden buffers.
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

nnoremap <silent> <leader>cb :call DeleteHiddenBuffers()<CR>

" Corrects the spelling under the cursor with the first suggestion.
nnoremap <leader>z 1z=

" Shows the amount of matches for the previous search.
nnoremap <leader>/ :%s///gn<CR>

" Strips the trailing white space from the file.
nnoremap <leader>w :%s/\s\+$//e<CR>

" Opens the split in a new tab. Kind like "distraction free" mode.
nnoremap <leader>f :tab sp<CR>

" Rebuild the tags.
nnoremap <leader>tg :GenerateTags<CR>

" Pull from either side of a git conflict.
nnoremap <leader>gl :diffget LOCAL<CR>
nnoremap <leader>gr :diffget REMOTE<CR>

" Quick session bindings.
nnoremap <leader>sw :mksession! .quicksave.vim<CR>
nnoremap <leader>sr :source .quicksave.vim<CR>
