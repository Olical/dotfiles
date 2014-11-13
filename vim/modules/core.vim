" Enable relative line numbers.
set number
set relativenumber

" Enable invisible characters.
set list

" More natural splitting.
set splitbelow
set splitright

" Enable mouse in normal mode. Great for resizing windows.
set mouse=n

" Enable persistent undo.
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Enable spell checking and a custom dictionary.
set spelllang=en_gb
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell

" Hilight searches.
set hlsearch

" Make search case insensitive, but become sensitive if an upper case
" character is used.
set ignorecase
set smartcase

" Make session files minimal.
set sessionoptions=blank,curdir,folds,help,tabpages,winsize

" Make spelling problems easier to read.
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline
highlight SpellLocal cterm=underline
highlight SpellRare cterm=underline
