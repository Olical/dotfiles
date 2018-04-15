" TODO Eval a motion or the innermost form, like cp{motion} and cpp in fireplace.

function! scheme#connect()
  vnew
  let s:repl_term_id = termopen('mit-scheme')
  normal! G
endfunction

function! scheme#eval_top_form()
  let l:save_clipboard = &clipboard
  set clipboard=
  let l:save_reg = getreg('s')
  let l:save_regmode = getregtype('s')

  normal yaF``

  let l:text = @@
  call setreg('s', l:save_reg, l:save_regmode)

  let &clipboard = l:save_clipboard

  call jobsend(s:repl_term_id, l:text . "\n")
endfunction

function! scheme#eval_file()
  for line in getline(1, '$')
    call jobsend(s:repl_term_id, line . "\n")
  endfor
endfunction

command SchemeConnect call scheme#connect()
command SchemeEvalTopForm call scheme#eval_top_form()
command SchemeEvalFile call scheme#eval_file()

autocmd FileType scheme nnoremap <buffer> <localleader>rc :SchemeConnect<cr>
autocmd FileType scheme nnoremap <buffer> <localleader>re :SchemeEvalTopForm<cr>
autocmd FileType scheme nnoremap <buffer> <localleader>rf :SchemeEvalFile<cr>
