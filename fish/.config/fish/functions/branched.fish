function branched
  for dir in $argv
    pushd $dir
    set -l branches (g b)

    if [ "$branches" != '* master' ]
      echo $dir
      g b
    end

    popd
  end
end
