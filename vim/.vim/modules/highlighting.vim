" Highlight searches.
set hlsearch

" Cross hair.
set cursorline
set cursorcolumn

function! s:after_colorscheme()
  " Make spelling problems easier to read.
  highlight clear SpellBad
  highlight clear SpellCap
  highlight clear SpellLocal
  highlight clear SpellRare

  highlight SpellBad cterm=underline
  highlight SpellCap cterm=underline
  highlight SpellLocal cterm=underline
  highlight SpellRare cterm=underline

  " Stop the cross hair ruining highlighting.
  highlight CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=3a3a3a guifg=NONE
  highlight CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=3a3a3a guifg=NONE
endfunction

augroup after_colorscheme
  autocmd!
  autocmd ColorScheme * call s:after_colorscheme()
augroup END
