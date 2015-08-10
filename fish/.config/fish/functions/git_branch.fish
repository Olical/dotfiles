function git_branch
  if is_git
    echo (git rev-parse --abbrev-ref HEAD 2> /dev/null)
  end
end
