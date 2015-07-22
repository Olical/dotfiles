" These bindings allow my conceal characters to work both ways. So if I type
" @, it is actually translated to this. I have conceal set up to render this
" as @. So I essentially have my own flavour of JavaScript but only in my Vim.
" Fantastic.

" Map the conceal characters to their expanded forms.
inoremap <buffer> <silent> @ <C-r>=syntax_expand#expand("@", "this")<CR>
inoremap <buffer> <silent> # <C-r>=syntax_expand#expand("#", "prototype")<CR>
inoremap <buffer> <silent> < <C-r>=syntax_expand#expand_head("<", "return")<CR>
