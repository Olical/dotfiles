ZSH_THEME_GIT_PROMPT_DIRTY="%U"
local lambda="$(parse_git_dirty)%(?,%{$fg[green]%},%{$fg[red]%})λ%{$reset_color%}%u"
local directory="%{$fg[blue]%}%c%{$reset_color%}"
PROMPT='${directory} ${lambda} '
