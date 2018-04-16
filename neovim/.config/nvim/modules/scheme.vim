function! scheme#connect()
  new
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

function! scheme#eval(type)
  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  call jobsend(s:repl_term_id, @@ . "\n")

  let &selection = sel_save
  let @@ = reg_save
endfunction

command! SchemeConnect call scheme#connect()
command! SchemeEvalTopForm call scheme#eval_top_form()
command! SchemeEvalFile call scheme#eval_file()
command! -range SchemeEval <line1>,<line2>call scheme#eval('range')

autocmd FileType scheme nnoremap <buffer> cp :set opfunc=scheme#eval<cr>g@

autocmd FileType scheme nnoremap <buffer> <localleader>rc :SchemeConnect<cr>
autocmd FileType scheme nnoremap <buffer> <localleader>re :SchemeEvalTopForm<cr>
autocmd FileType scheme nnoremap <buffer> <localleader>rf :SchemeEvalFile<cr>

