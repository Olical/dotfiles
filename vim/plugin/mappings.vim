" Set the local leader.
let maplocalleader = "|"

" Clears the search.
nnoremap <silent> <leader>c/ :nohlsearch<CR>

" Corrects the spelling under the cursor with the first suggestion.
nnoremap <leader>z 1z=

" Shows the amount of matches for the previous search.
nnoremap <leader>/ :%s///gn<CR>

" Strips the trailing white space from the file.
nnoremap <leader>w :%s/\s\+$//e<CR>

" Opens the split in a new tab. Kind like "distraction free" mode.
nnoremap <leader>f :tab sp<CR>

" Rebuild the tags.
nnoremap <F5> :GenerateTags<CR>

" Pull from either side of a git conflict.
nnoremap <leader>gl :diffget LOCAL<CR>
nnoremap <leader>gr :diffget REMOTE<CR>

" Use the jk roll to exit insert mode.
inoremap jk <Esc>
