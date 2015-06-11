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

inoremap <silent> @ <C-r>=<SID>syntax_expand("@", "this")<CR>
