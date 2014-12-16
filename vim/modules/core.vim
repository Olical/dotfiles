" Enable relative line numbers.
set number

" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Enable invisible characters.
set list

" More natural splitting.
set splitbelow
set splitright

" Set a default indent, but vim-sleuth should adjust it.
set shiftwidth=4

" Enable mouse in normal mode. Great for resizing windows.
set mouse=n
