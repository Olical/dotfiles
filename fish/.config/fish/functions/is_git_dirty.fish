function is_git_dirty
  is_git; and [ (git status | tail -n1) != "nothing to commit, working tree clean" ]
end
