syntax on

try
  colorscheme lucius
  LuciusBlack
catch
  " Nothing to see here.
endtry

" Improve screen clearing by using the background colour.
set t_ut=

" Make spelling problems easier to read.
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare

highlight SpellBad cterm=underline
highlight SpellCap cterm=underline
highlight SpellLocal cterm=underline
highlight SpellRare cterm=underline

" Highlight whitespace.
highlight SpecialKey ctermfg=white
highlight ExtraWhitespace ctermfg=white ctermbg=1
match ExtraWhitespace /\s\+$/
