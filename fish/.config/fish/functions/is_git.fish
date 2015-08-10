function is_git
  git symbolic-ref HEAD > /dev/null 2>&1
end
