" Add better UTF-8 support.
scriptencoding utf-8
set encoding=utf-8

" Improve the backspace key.
set backspace=indent,eol,start

" Disable the swap files.
set noswapfile

" Enable the matchit plugin.
runtime macros/matchit.vim

" More natural splitting.
set splitbelow
set splitright

" Make <C-A> and <C-X> increment and decrement all numbers as decimals.
set nrformats=

" Disabled code folding. It can be weird sometimes.
set nofoldenable

" Enable the tab complete menu.
set wildmenu

" Increase the command line history length.
set history=1000

" Show the file name in the window title bar.
set title

" Enable line numbers.
set number
set relativenumber

" Show invisible characters.
set listchars=tab:▸\ ,trail:·
set list

" Enable mouse support for normal mode.
set mouse=n
set ttymouse=xterm2

" Don't reset cursor to start of line when moving around.
set nostartofline

" Always show status line.
set laststatus=2

" Don't show the intro message when starting vim.
set shortmess=atI

" Disable the extra line at the end of files.
set binary
set noeol

" Start scrolling three lines before the horizontal window border.
set scrolloff=3

" Disable error bells.
set noerrorbells visualbell t_vb=
augroup GUIBell
  autocmd!
  autocmd GUIEnter * set visualbell t_vb=
augroup END

" Improve the speed for updating the status line when leaving insert mode.
set timeoutlen=2000 ttimeoutlen=0