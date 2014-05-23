" More minimal sessions.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Quick session bindings.
nnoremap <F7> :mksession! .quicksave.vim<CR>
nnoremap <F8> :source .quicksave.vim<CR>

" Highlight searches.
set hlsearch

" Ignore case of searches.
set ignorecase

" If the search contains an upper-case character, become case sensitive.
set smartcase

" Highlight dynamically as pattern is typed.
set incsearch
