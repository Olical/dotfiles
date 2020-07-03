function fish_right_prompt
  if is_git
    set_color yellow
    echo -n (git_branch)
    set_color normal
    echo -n ' '
  end

  set_color blue
  echo -n (basename (pwd | sed "s#$HOME#\~#"))
  set_color normal
end

