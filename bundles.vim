" Load Vundle. Manages all of the bundles.
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Specify all bundles.
Bundle 'gmarik/vundle'

" Syntax and language improvements.
Bundle 'groenewege/vim-less'
Bundle 'helino/vim-json'
Bundle 'mustache/vim-mode'
Bundle 'pangloss/vim-javascript'
Bundle 'pfdevilliers/Pretty-Vim-Python'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/django.vim'
Bundle 'dag/vim-fish'

" General.
Bundle 'ciaranm/detectindent'
Bundle 'AndrewRadev/switch.vim'
Bundle 'malkomalko/projections.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'PeterRincker/vim-argumentative'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mhinz/vim-signify'
Bundle 'bling/vim-airline'
Bundle 'embear/vim-localvimrc'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'kien/ctrlp.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'mattn/emmet-vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'bruno-/vim-vertical-move'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" Text objects.
Bundle 'kana/vim-textobj-user'
Bundle 'glts/vim-textobj-comment'
Bundle 'kana/vim-textobj-datetime'
Bundle 'kana/vim-textobj-entire'
Bundle 'kana/vim-textobj-indent'
Bundle 'mattn/vim-textobj-url'

" Enable some syntax settings that had to be disabled for Vundle.
filetype plugin indent on

" Configure syntastic.
let g:syntastic_mode_map={ 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html', 'cpp'] }
let g:syntastic_check_on_open=1

" Configure YouCompleteMe.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Configure localvimrc.
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" Configure emmet.
let g:user_emmet_settings={
\	'indentation': '	'
\}
let g:user_emmet_leader_key='<C-k>'

" Configure EasyMotion.
let g:EasyMotion_leader_key='<Space>'

" Configure airline.
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Configure delimitMate
let delimitMate_expand_cr=1

" Configure switch custom definitions.
let g:switch_custom_definitions=[
\	['on', 'off'],
\	['0', '1'],
\	['yes', 'no'],
\	['before', 'after'],
\	['visible', 'hidden'],
\	['block', 'none'],
\	['!important', '/*!important*/']
\]

" Toggle numbers bundle. (l)
nnoremap <leader>l :NumbersToggle<CR>

" Switch commands.
nmap <leader>s :Switch<CR>

" Ag commands.
nmap <leader>a :Ag! "<cword>"<CR>

" Shows the errors window. (e)
nmap <silent> <leader>e :Errors<CR>

" Gundo commands. (u)
nmap <silent> <leader>u :GundoToggle<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" Enable indent guides on boot and allow colorschemes to style them.
nmap <silent> <leader>i :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

" Enable indentation detection.
let g:detectindent_preferred_indent=4
autocmd BufReadPost * :DetectIndent
