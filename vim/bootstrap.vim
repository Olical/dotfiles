" Make Vim more useful. This should always be your first configuration line.
set nocompatible

" Load all configuration modules.
for f in split(glob('~/.vim/modules/*.vim'), '\n')
  execute 'source' f
endfor
