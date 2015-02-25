" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '~/.vim/' . a:path
endfunction

" Load all configuration modules.
for file in split(glob(Dot('modules/*.vim')), '\n')
  execute 'source' file
endfor
