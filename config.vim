" To activate, add the following to ~/.vimrc
" source $HOME/.vim/config.vim
"
" Add this before you include the config to enable light mode.
" let g:light_editor=1

" Make vim more useful. I think this drops vi compatibility.
" This allows vim to do a lot more and stray from it's roots.
set nocompatible

" Change the leader to something a bit easier to hit.
" Then remaps the reverse find command.
let mapleader=','
noremap \ ,

" Enable better indentation.
set autoindent smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

if !exists('g:light_editor')
	" Include all of the bundle configuration.
	source $HOME/.vim/bundles.vim
endif

" Improve the colours.
syntax on
set background=dark
set t_Co=256
colorscheme custom

" Add more syntax highlighting mappings.
au BufNewFile,BufRead *.webapp set filetype=json
au BufNewFile,BufRead *.html set filetype=html

" Change indentation for certain file types.
autocmd FileType python setlocal expandtab

" Improve the backspace key.
set backspace=indent,eol,start

" Improve completion.
set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone
set wildmode=longest,list

" Enable the matchit plugin.
runtime macros/matchit.vim

" Make <C-A> and <C-X> increment and decrement all numbers as decimals.
set nrformats=

" Stop hyphens being regarded as a word separator.
set iskeyword+=-

" Disabled code folding. It can be weird sometimes.
set nofoldenable

" Increase the command line history length.
set history=1000

" Clears the search. (m)
nmap <silent> <leader>m :nohlsearch<CR>

" Rebuild the tags. (F5)
set tags+=.tags
map <F5> :!ctags -Rf ./.tags --python-kinds=-i --exclude=.git `cat .srclist`<CR><CR>
autocmd FileType javascript map <buffer> <F5> :!jsctags -f ./.tags `cat .srclist`<CR><CR>

" Add a line in the 81st column.
set colorcolumn=81

" Show the file name in the window title bar.
set title

" Remove backup and swap.
set nobackup
set noswapfile
set nowritebackup

" Disable the arrow keys in normal mode.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Enable line numbers.
set number

" Improve line breaking.
set nolist

" Show invisible characters.
set listchars=tab:▸\ ,trail:·
set list

" Improve screen clearing by using the background colour.
set t_ut=

" Highlight searches.
set hlsearch

" Highlight the current line.
set cursorline

" Ignore case of searches.
set ignorecase

" Highlight dynamically as pattern is typed.
set incsearch

" If the search contains an upper-case character, become case sensitive.
set smartcase

" Set the default encoding to UTF-8.
set enc=utf-8

" Configure the spelling language and file.
set spelllang=en_gb
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell

" Disable error bells.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Don't reset cursor to start of line when moving around.
set nostartofline

" Always show status line.
set laststatus=2

" Show the cursor position.
set ruler

" Don't show the intro message when starting vim.
set shortmess=atI

" Disable the extra line at the end of files.
set binary
set noeol

" Start scrolling three lines before the horizontal window border.
set scrolloff=3