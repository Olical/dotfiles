" These bindings allow my conceal characters to work both ways. So if I type
" @, it is actually translated to this. I have conceal set up to render this
" as @. So I essentially have my own flavour of JavaScript but only in my Vim.
" Fantastic.

" Returns a mapped version of the list.
" http://learnvimscriptthehardway.stevelosh.com/chapters/39.html#higher-order-functions
function! Mapped(fn, l)
  let new_list = deepcopy(a:l)
  call map(new_list, string(a:fn) . '(v:val)')
  return new_list
endfunction

" Expands the given character as long as it's not in a comment or string.
function! s:syntax_expand(from, to)
  let syntax = synIDtrans(synID(line("."), col(".") - 1, 1))
  let blacklist = Mapped(function("hlID"), ["Comment", "String"])

  if index(blacklist, syntax) == -1
    return a:to
  else
    return a:from
  endif
endfunction

" Performs a syntax expand, but only if we're at the head of a line.
" This stops `<` to `return` happening when typing <= for example.
function! s:syntax_expand_head(from, to)
  let column = col(".") - 2
  let before = ""

  if column >= 0
    let before = getline(".")[:column]
  endif

  echom before

  if before =~# "\\v^\\s*$"
    return <SID>syntax_expand(a:from, a:to)
  else
    return a:from
  endif
endfunction

" Map the conceal characters to their expanded forms.
inoremap <silent> @ <C-r>=<SID>syntax_expand("@", "this")<CR>
inoremap <silent> # <C-r>=<SID>syntax_expand("#", "prototype")<CR>
inoremap <silent> < <C-r>=<SID>syntax_expand_head("<", "return")<CR>
