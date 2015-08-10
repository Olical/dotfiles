function fish_right_prompt
  set_color blue
  echo -n (basename (pwd | sed "s#$HOME#\~#"))
  set_color normal
end

