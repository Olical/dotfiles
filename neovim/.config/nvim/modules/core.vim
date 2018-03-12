" Enable invisible characters.
set list

" More natural splitting.
set splitbelow
set splitright

" Set a default indent, but vim-sleuth should adjust it.
set tabstop=2
set shiftwidth=2
set expandtab

" Disable swap files.
set noswapfile

" Write files as they are, don't mess with line endings etc.
set binary

" Disable the completion preview window.
set completeopt-=preview

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize
