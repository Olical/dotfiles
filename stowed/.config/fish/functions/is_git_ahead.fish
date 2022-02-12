function is_git_ahead
  set -l revs (git rev-list origin/(git_branch)..HEAD 2> /dev/null)
  [ "$revs" != "" ]
end
