" To activate, add the following to ~/.vimrc
" source $HOME/.vim/config.vim
"
" Add this before you include the config to enable light mode.
" let g:light_editor=1

" Add better UTF-8 support.
scriptencoding utf-8
set encoding=utf-8

" Make vim more useful. I think this drops vi compatibility.
" This allows vim to do a lot more and stray from it's roots.
set nocompatible

" Enable better indentation.
set autoindent smartindent
set smarttab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
let g:html_indent_inctags='html,body,head,tbody'

" Include all of the bundle configuration.
if !exists('g:light_editor')
	source $HOME/.vim/bundles.vim
endif

" Improve the colours.
syntax on

try
	colorscheme distinguished
	source $HOME/.vim/colorscheme-tweaks.vim
catch /^Vim\%((\a\+)\)\=:E185/
	" NO COLOUR FOR YOU
endtry

" Improve the backspace key.
set backspace=indent,eol,start

" Disable the swap files.
set noswapfile

" Enable the matchit plugin.
runtime macros/matchit.vim

" Enable virtualenv.
if has('python') && !empty($VIRTUAL_ENV)
python << EOF
import os
import sys
a = os.environ['VIRTUAL_ENV'] + '/bin/activate_this.py'
execfile(a, dict(__file__ = a))
if 'PYTHONPATH' not in os.environ:
	os.environ['PYTHONPATH'] = ''
	os.environ['PYTHONPATH'] += ':' + os.getcwd()
	os.environ['PYTHONPATH'] += ':'.join(sys.path)
EOF
endif

" Make <C-A> and <C-X> increment and decrement all numbers as decimals.
set nrformats=

" Disabled code folding. It can be weird sometimes.
set nofoldenable

" Enable the tab complete menu.
set wildmenu

" Increase the command line history length.
set history=1000

" Clears the search. (c)
nmap <silent> <leader>c/ :nohlsearch<CR>

" Corrects the spelling under the cursor with the first suggestion.
nmap <leader>z 1z=

" Shows the amount of matches for the previous search. (/)
nmap <leader>/ :%s///gn<CR>

" Strips the trailing white space from the file.
nmap <leader>w :%s/\s\+$//e<CR>

" Opens the split in a new tab. Kind like "distraction free" mode. (f)
nmap <leader>f :tab sp<CR>

" Rebuild the tags. (F5)
set tags+=.tags
command! GenerateTags call system('ctags -Rf ./.tags --python-kinds=-i --exclude=.git `cat .srclist`') | echo
nmap <F5> :GenerateTags<CR>

" Show the file name in the window title bar.
set title

" Enable line numbers.
set number

" Show invisible characters.
set listchars=tab:▸\ ,trail:·
set list

" Improve screen clearing by using the background colour.
set t_ut=

" Highlight searches.
set hlsearch

" Ignore case of searches.
set ignorecase

" If the search contains an upper-case character, become case sensitive.
set smartcase

" Highlight dynamically as pattern is typed.
set incsearch

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

" Improve the speed for updating the status line when leaving insert mode.
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

" Don't show the intro message when starting vim.
set shortmess=atI

" Disable the extra line at the end of files.
set binary
set noeol

" Start scrolling three lines before the horizontal window border.
set scrolloff=3