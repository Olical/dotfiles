function branched
  for dir in $argv
    pushd $dir
    set -l branches (g b)

    if [ "$branches" != '* master' ]
      basename $dir
      g b
    end

    popd
  end
end
