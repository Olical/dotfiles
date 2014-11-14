" Hilight searches.
set hlsearch

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
endfunction

augroup after_colorscheme
    autocmd!
    autocmd ColorScheme * call s:after_colorscheme()
augroup END
