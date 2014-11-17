" Die early if this Vim install is built with tiny or small.
" We don't want a Raspberry Pi, for example, running all of these.
if !1 | finish | endif

" Load NeoBundle commands and star the package list.
set runtimepath +=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand(Dot('bundle/')))
NeoBundleFetch 'Shougo/neobundle.vim'

" Load bundle list for NeoBundle to manage.
execute 'source' Dot('bundles.vim')

" Finish NeoBundle configuration.
call neobundle#end()
filetype plugin indent on

" Load bundle configuration files for currently sourced bundles. If the bundle
" isn't installed at all then warn the user, it probably means a bundle was
" removed but it's configuration was not.
function! s:configure_bundle(file)
  let bundle = fnamemodify(a:file, ':t:r')
  let required = s:is_required(bundle)
  let installed = neobundle#is_installed(bundle)
  let sourced = neobundle#is_sourced(bundle)

  if installed && sourced
    execute 'source' a:file
  elseif !installed && !required
    echoerr "Configuration for unknown bundle at" a:file
  endif
endfunction

" Check if the bundle is referenced in the bundle declaration list, but isn't
" currently installed.
function! s:is_required(bundle)
  let not_installed = neobundle#get_not_installed_bundle_names()
  return index(not_installed, a:bundle) >= 0
endfunction

" Process all present bundle configuration files.
for file in split(glob(Dot('modules/bundles/*.vim')), '\n')
  call s:configure_bundle(file)
endfor
