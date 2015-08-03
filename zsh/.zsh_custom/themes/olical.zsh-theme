ZSH_THEME_GIT_PROMPT_DIRTY="%U"
local lambda="%(?,%{$fg[green]%},%{$fg[red]%})λ%{$reset_color%}"
PROMPT='$(parse_git_dirty)${lambda}%{$reset_color%} '
