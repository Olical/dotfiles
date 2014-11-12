" Make vim more useful. I think this drops vi compatibility.
" This allows vim to do a lot more and stray from it's roots.
set nocompatible

" Include all of the bundle configuration.
source $HOME/.vim/bundles.vim

" Load all configuration modules.
for f in split(glob('~/.vim/modules/*.vim'), '\n')
  exe 'source' f
endfor
