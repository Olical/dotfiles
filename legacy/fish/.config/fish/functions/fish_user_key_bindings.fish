function fish_user_key_bindings
  fish_vi_key_bindings

  if command -s fzf-share >/dev/null
    source (fzf-share)/key-bindings.fish
  end

  if type -q fzf_key_bindings
    fzf_key_bindings
  end

  bind -M insert -m default jk backward-char force-repaint
end
