# A lambda (λ) prompt.
# Green and red depending on exit status.
# Underlined if git status is dirty.
# Uppercase (Λ) if ahead of the remote.

function fish_prompt
  if is_status_okay
    set_color green
  else
    set_color red
  end

  if is_git_dirty
    set_color -u
  end

  echo -n  'λ'
  set_color normal
  echo -n ' '
end

