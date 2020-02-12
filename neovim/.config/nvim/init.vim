call plug#begin(stdpath('data') . '/plugged-init')
" Plug 'Olical/aniseed', { 'branch': 'develop' }
Plug '~/repos/olical/aniseed'
call plug#end()

lua require('aniseed.dotfiles')
