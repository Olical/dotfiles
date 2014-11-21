" Enable relative line numbers.
set number
set relativenumber

" Backspace is managed by vim-sensible, but I need it here too because some
" plugins depend on it during start up.
set backspace=indent,eol,start

" Use fource spaces as indentation.
" This is just a default, filetypes may override.
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Enable invisible characters.
set list

" More natural splitting.
set splitbelow
set splitright

" Enable mouse in normal mode. Great for resizing windows.
set mouse=n

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Stop completion engines popping windows up.
set completeopt-=preview
