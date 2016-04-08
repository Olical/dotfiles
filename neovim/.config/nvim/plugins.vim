" This is the main plugin list, sourced by modules/plugins.vim
" Configuration goes in the appropriate modules/plugins/*.vim file.
" So configuration for tmux.vim would go in modules/plugins/tmux.vim.vim

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !python2 ./install.py
  endif
endfunction

Plug 'Keithbsmiley/tmux.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'Lokaltog/vim-easymotion'
Plug 'Olical/vim-enmasse', { 'on': 'EnMasse' }
Plug 'Olical/vim-expand', { 'on': 'Expand' }
Plug 'Olical/vim-impl'
Plug 'PeterRincker/vim-argumentative'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim' | Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'SirVer/ultisnips'
Plug 'adimit/prolog.vim'
Plug 'aklt/plantuml-syntax'
Plug 'andreimaxim/vim-io'
Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-scala'
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'floobits/floobits-neovim'
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'haya14busa/vim-asterisk'
Plug 'helino/vim-json'
Plug 'junegunn/vader.vim'
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'lambdatoast/elm.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
Plug 'raymond-w-ko/vim-niji', { 'for': 'clojure' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'sevko/vim-nand2tetris-syntax'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'snoe/nvim-parinfer.js'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
