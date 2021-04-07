call plug#begin(stdpath('data') . '/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'LnL7/vim-nix'
Plug 'Olical/AnsiEsc'
Plug 'Olical/aniseed', {'branch': 'develop'}
Plug 'Olical/conjure', {'branch': 'develop'}
Plug 'Olical/fennel.vim'
Plug 'Olical/kkslider'
Plug 'Olical/nvim-local-fennel', {'branch': 'develop'}
Plug 'Olical/vim-enmasse'
Plug 'PeterRincker/vim-argumentative'
Plug 'airblade/vim-gitgutter'
Plug 'clojure-vim/clojure.vim'
Plug 'clojure-vim/vim-jack-in'
Plug 'dag/vim-fish'
Plug 'easymotion/vim-easymotion'
Plug 'guns/vim-sexp' | Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'hashivim/vim-terraform'
Plug 'hrsh7th/nvim-compe' | Plug 'tami5/compe-conjure'
Plug 'hylang/vim-hy'
Plug 'itchyny/lightline.vim'
Plug 'janet-lang/janet.vim'
Plug 'jiangmiao/auto-pairs', {'tag': 'v2.0.0'}
Plug 'junegunn/fzf', { 'commit': 'fc7630a66d8b07ec90603f7919f8aadf891783ac' } | Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/suda.vim'
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
Plug 'w0rp/ale'
Plug 'wlangstroth/vim-racket'

call plug#end()

let g:aniseed#env = v:true
