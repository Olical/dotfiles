" Load Vundle. Manages all of the bundles.
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Specify all bundles.
Bundle 'gmarik/vundle'

" Language specific.
Bundle 'kchmck/vim-coffee-script'
Bundle 'helino/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'vim-scripts/django.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/vim-javascript-syntax'
Bundle 'pfdevilliers/Pretty-Vim-Python'
Bundle 'juvenn/mustache.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-markdown'

" General.
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle 'gerw/vim-HiLinkTrace'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'embear/vim-localvimrc'
Bundle 'SirVer/ultisnips'
Bundle 'nelstrom/vim-qargs'
Bundle 'wikitopian/hardmode'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-eunuch'

" Text objects.
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-datetime'
Bundle 'kana/vim-textobj-lastpat'
Bundle 'mattn/vim-textobj-url'

" Enable some syntax settings that had to be disabled for Vundle.
filetype plugin indent on

" Configure syntastic.
let g:syntastic_mode_map={ 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html', 'cpp'] }
let g:syntastic_check_on_open=1

" Configure localvimrc.
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" Configure zencoding.
let g:user_zen_settings = {
\	'indentation': '	'
\}

" Configure Ultisnips.
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsSnippetDirectories = ['.snippets', 'snippets']

" Ag commands.
nmap <leader>a :Ag! "<cword>\s*\("<CR>

" Shows the errors window. (e)
nmap <silent> <leader>e :Errors<CR>

" Gundo commands. (u)
nmap <silent> <leader>u :GundoToggle<CR>

" Toggle the NERDTree pane. (n)
nmap <silent> <leader>n :NERDTreeTabsToggle<CR>

" Use CtrlP to search tags. (p)
nmap <silent> <leader>p :CtrlPTag<CR>

" Toggle hard mode, also enable it by default.
nmap <leader>h :call ToggleHardMode()<CR>
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Enable indent guides on boot and allow colorschemes to style them.
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
