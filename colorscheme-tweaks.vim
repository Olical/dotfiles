" Color values can be extracted from this chart:
" https://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png

" If the vim-indent-guides bundle is installed then we can set the colors.
if exists('g:indent_guides_auto_colors')
	au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
	au VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
endif

" Make spelling problems easier to read.
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

hi SpellBad cterm=underline
hi SpellCap cterm=underline
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

" Whitespace.
hi SpecialKey ctermfg=white
hi ExtraWhitespace ctermfg=white ctermbg=1
mat ExtraWhitespace /\s\+$/