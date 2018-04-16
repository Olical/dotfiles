function! scheme#connect()
  new
  let s:repl_term_id = termopen('mit-scheme')
  normal! G
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
command! -range=% SchemeEval <line1>,<line2>call scheme#eval('range')

autocmd FileType scheme nnoremap <buffer> cp :set opfunc=scheme#eval<cr>g@
autocmd FileType scheme nnoremap <buffer> cpp :normal cpaf<cr>

autocmd FileType scheme nnoremap <buffer> <localleader>rc :SchemeConnect<cr>
autocmd FileType scheme nnoremap <buffer> <localleader>re :normal cpaF<cr>``
autocmd FileType scheme nnoremap <buffer> <localleader>rf :SchemeEval<cr>

