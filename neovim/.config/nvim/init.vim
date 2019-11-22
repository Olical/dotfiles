call plug#begin(stdpath('data') . '/plugged')
Plug 'Olical/aniseed'
call plug#end()

lua require("config/bootstrap")
