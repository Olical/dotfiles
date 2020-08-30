call plug#begin(stdpath('data') . '/plugged')

Plug 'LnL7/vim-nix'
Plug 'Olical/AnsiEsc'
Plug 'Olical/aniseed', {'branch': 'develop'}
Plug 'Olical/conjure', {'branch': 'develop'}
Plug 'Olical/kkslider'
Plug 'Olical/nvim-local-fennel', {'branch': 'develop'}
Plug 'Olical/vim-enmasse'
Plug 'PeterRincker/vim-argumentative'
Plug 'Shougo/deoplete.nvim' | Plug 'ncm2/float-preview.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'bakpakin/fennel.vim'
Plug 'clojure-vim/vim-jack-in'
Plug 'dag/vim-fish'
Plug 'easymotion/vim-easymotion'
Plug 'guns/vim-sexp' | Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'janet-lang/janet.vim'
Plug 'jiangmiao/auto-pairs', {'tag': 'v2.0.0'}
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/suda.vim'
Plug 'leafgarland/typescript-vim'
Plug 'liuchengxu/vim-better-default'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pangloss/vim-javascript' | Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript']}
Plug 'radenling/vim-dispatch-neovim'
Plug 'simnalamburt/vim-mundo'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'voldikss/vim-floaterm'
Plug 'w0rp/ale'

call plug#end()

lua require('aniseed.dotfiles')
