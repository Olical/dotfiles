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
  \ 'tmux_height': '40%'
  \})
endfunction

function! s:ag_fzf()
  call fzf#run({
  \ 'source': 'ag -l -g ""',
  \ 'sink': 'edit',
  \ 'tmux_height': '40%'
  \})
endfunction

nnoremap <silent> <leader>bf :call <SID>buf_fzf()<CR>
nnoremap <silent> <leader>f :call <SID>ag_fzf()<CR>
