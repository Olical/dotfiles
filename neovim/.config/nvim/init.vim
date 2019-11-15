call plug#begin(stdpath('data') . '/plugged')
Plug 'Olical/aniseed', { 'tag': 'v0.0.0' }
call plug#end()

lua require("config/bootstrap")
