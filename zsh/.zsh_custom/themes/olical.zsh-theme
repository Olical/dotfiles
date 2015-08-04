ZSH_THEME_GIT_PROMPT_DIRTY='%Uλ%u'
ZSH_THEME_GIT_PROMPT_CLEAN='λ'
local dir='%{$fg[blue]%}%1~%{$reset_color%}'
local lambda='%(?,%{$fg[green]%},%{$fg[red]%})$(parse_git_dirty)%{$reset_color%} '
PROMPT="$dir $lambda"
