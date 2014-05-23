" Load Vundle. Manages all of the bundles.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Specify all bundles.
Plugin 'gmarik/Vundle.vim'

" Syntax and language improvements.
Plugin 'derekwyatt/vim-scala'
Plugin 'helino/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'mxw/vim-jsx'

" Mine!
Plugin 'Wolfy87/vim-enmasse'

" General.
Plugin 'Lokaltog/vim-distinguished'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'junegunn/vader.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'mhinz/vim-signify'
Plugin 'myusuf3/numbers.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectile'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'walm/jshint.vim'

" Text objects.
Plugin 'glts/vim-textobj-comment'
Plugin 'kana/vim-textobj-datetime'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-user'
Plugin 'mattn/vim-textobj-url'

" Enable some syntax settings that had to be disabled for Vundle.
call vundle#end()
filetype plugin indent on

" Configure syntastic.
let g:syntastic_check_on_open=1
let g:syntastic_mode_map={
  \'mode': 'active',
  \'active_filetypes': [],
  \'passive_filetypes': ['html', 'cpp', 'java', 'scala']
\}

" Configure YouCompleteMe.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Configure UltiSnips.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" Configure localvimrc.
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" Configure sneak.
let g:sneak#streak=1

" Configure airline.
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Configure promptline.
let g:promptline_powerline_symbols=0
let g:promptline_preset = {
  \'a' : [ promptline#slices#user() ],
  \'b' : [ promptline#slices#jobs(), promptline#slices#vcs_branch() ],
  \'c' : [ promptline#slices#cwd() ],
  \'warn' : [ promptline#slices#last_exit_code() ]
\}

" Configure delimitMate
let delimitMate_expand_cr=1

" Ag motion mappings. (stolen from Steve Losh!)
nnoremap <silent> <leader>a :set opfunc=<SID>AgMotion<CR>g@
xnoremap <silent> <leader>a :<C-U>call <SID>AgMotion(visualmode())<CR>

nnoremap <bs> :Ag! '\b<c-r><c-w>\b'<cr>
xnoremap <silent> <bs> :<C-U>call <SID>AgMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
  if a:type ==# 'v'
    silent execute "normal! `<" . a:type . "`>y"
  elseif a:type ==# 'char'
    silent execute "normal! `[v`]y"
  endif
endfunction

function! s:AgMotion(type) abort
  let reg_save = @@
  call s:CopyMotionForType(a:type)
  execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"
  let @@ = reg_save
endfunction

" Gundo commands. (u)
nnoremap <silent> <leader>u :GundoToggle<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" Enable indent guides on boot and allow colorschemes to style them.
nnoremap <silent> <leader>i :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

augroup IndentGuideColors
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
augroup END

" Enable rainbow parenthesis.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
