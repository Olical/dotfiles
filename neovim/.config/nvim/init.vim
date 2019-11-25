call plug#begin(stdpath('data') . '/plugged')
Plug 'Olical/aniseed', { 'branch': 'develop' }
call plug#end()

lua require("config/bootstrap")
