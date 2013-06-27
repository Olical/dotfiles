" Color values can be extracted from this chart:
" https://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png

" If the vim-indent-guides bundle is installed then we can set the colors.
if exists('g:indent_guides_auto_colors')
	au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
	au VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
endif

" Make spelling problems easier to read.
hi SpellBad ctermfg=black
hi SpellCap ctermfg=black
hi SpellLocal ctermfg=black
hi SpellRare ctermfg=black

" Whitespace.
hi SpecialKey ctermfg=white
hi ExtraWhitespace ctermfg=white ctermbg=1
mat ExtraWhitespace /\s\+$/