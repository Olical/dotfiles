function fcd
  if set -q argv[1]
    set searchdir $argv[1]
  else
    set searchdir $HOME
  end

  set -l destdir (find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf)

  if test -z "$destdir"
    return 1
  end

  cd $destdir
end
