" Run expand on your current line or range of lines.
" Allows you to repeat {lines,blocks} like this {1..3} times.

" Allows you to repeat lines like this 1 times.
" Allows you to repeat lines like this 2 times.
" Allows you to repeat lines like this 3 times.
" Allows you to repeat blocks like this 1 times.
" Allows you to repeat blocks like this 2 times.
" Allows you to repeat blocks like this 3 times.

function! s:expand() range
  let new_line = "_THIS_IS_A_NEW_LINE_"
  let selection = join(getline(a:firstline, a:lastline), new_line)
  let expanded = substitute(expand(selection), "\n", new_line, 'g')
  let lines = split(expanded, new_line)

  execute 'silent! ' . a:firstline . ',' . a:lastline . 'd'
  call append(a:firstline - 1, lines)
  execute 'silent! normal =' . len(lines) . 'k'
endfunction

command! -range Expand :<line1>,<line2>call <SID>expand()
