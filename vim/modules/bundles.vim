" Die early if this Vim install is built with tiny or small.
" We don't want a Raspberry Pi, for example, running all of these.
if !1 | finish | endif

" Load NeoBundle commands and star the package list.
set runtimepath +=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" List all plugins for NeoBundle to manage.
" Configuration goes in the appropriate ~/.vim/modules/bundles/*.vim file.
NeoBundle 'Keithbsmiley/tmux.vim'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'Lokaltog/vim-distinguished'

" Finish NeoBundle configuration.
call neobundle#end()
filetype plugin indent on

" Load bundle configuration files for currently sourced bundles.
for f in split(glob('~/.vim/modules/bundles/*.vim'), '\n')
  let bundle = fnamemodify(f, ':t:r')
  if neobundle#is_installed(bundle) && neobundle#is_sourced(bundle)
    execute 'source' f
  endif
endfor
