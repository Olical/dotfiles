" Color values can be extracted from this chart:
" https://upload.wikimedia.org/wikipedia/commons/9/95/Xterm_color_chart.png

" If the vim-indent-guides bundle is installed then we can set the colors.
if exists('g:indent_guides_auto_colors')
	au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=white ctermbg=234
	au VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=white ctermbg=236
endif

" Use an underline to show spelling errors.
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

hi SpellBad cterm=underline
hi SpellCap cterm=underline
hi SpellLocal cterm=underline
hi SpellRare cterm=underline

" Popup menu.
hi Pmenu ctermbg=17 ctermfg=255
hi PmenuSel ctermbg=27 ctermfg=white

" Vertical rule.
hi ColorColumn ctermbg=52

" Whitespace.
hi SpecialKey ctermfg=white
hi ExtraWhitespace ctermfg=white ctermbg=1
mat ExtraWhitespace /\s\+$/

" Line numbers.
hi LineNr ctermfg=grey ctermbg=233
hi CursorLineNR ctermfg=white ctermbg=237

" Current line.
hi CursorLine cterm=NONE ctermbg=233

" Diffs.
hi clear DiffAdd
hi clear DiffChange
hi clear DiffDelete
hi clear DiffText

hi DiffAdd ctermbg=22
hi DiffChange ctermbg=18
hi DiffDelete ctermbg=52
hi DiffText ctermbg=57

" Generic syntax.
hi Error ctermbg=52
hi String ctermfg=40
hi Comment ctermfg=244
hi Special ctermfg=39
hi Function ctermfg=3
hi Identifier ctermfg=89
hi Statement ctermfg=208
hi Constant ctermfg=37
hi Normal ctermfg=white

" JavaScript specific.
hi javaScriptParens ctermfg=255
hi javaScriptBraces ctermfg=255

" VimL specific.
hi vimIsCommand ctermfg=39

" Python specific.
hi pythonClass ctermfg=39