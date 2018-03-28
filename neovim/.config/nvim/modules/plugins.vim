call plug#begin()

execute "source" Dot("plugins.vim")

call plug#end()

for file in split(glob(Dot("modules/plugins/*.vim")), "\n")
  let name = fnamemodify(file, ":t:r")

  if exists("g:plugs[\"" . name . "\"]")
    exec "source" file
  else
    echom "No plugin found for config file " . file
  endif
endfor
