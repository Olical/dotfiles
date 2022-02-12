function is_git
  git symbolic-ref HEAD &> /dev/null
end
