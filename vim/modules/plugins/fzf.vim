nnoremap <leader>f :FZF<CR>

function! s:buf_list()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:buf_open(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

function! s:buf_fzf()
  call fzf#run({
  \ 'source': reverse(<SID>buf_list()),
  \ 'sink': function('<SID>buf_open'),
  \ 'options': '+m',
  \ 'tmux_height': '40%'
  \})
endfunction

nnoremap <Leader>bf :call <SID>buf_fzf()<CR>
